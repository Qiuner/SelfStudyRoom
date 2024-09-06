<!-- 我是座位管理的前端代码 -->

<template>
  <div :class="`${themes[themeStatus]}`">
    <div style="margin: 10px 0">
      <el-input
        style="width: 200px"
        placeholder="请输入名称"
        suffix-icon="el-icon-search"
        v-model="name"
      ></el-input>
      <el-button class="ml-5" plain type="primary" @click="load"
        >搜索</el-button
      >
      <el-button type="info" plain @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-button type="primary" plain @click="handleAdd"
        >新增 <i class="el-icon-circle-plus-outline"></i
      ></el-button>
      <el-popconfirm
        class="ml-5"
        confirm-button-text="确定"
        cancel-button-text="我再想想"
        icon="el-icon-info"
        icon-color="red"
        title="您确定批量删除这些数据吗？"
        @confirm="delBatch"
      >
        <el-button type="danger" plain slot="reference"
          >批量删除 <i class="el-icon-remove-outline"></i
        ></el-button>
      </el-popconfirm>
    </div>

    <el-table
      :data="tableData"
      stripe
      @selection-change="handleSelectionChange"
      :header-cell-style="{ 'padding-left': '4px', 'padding-right': '4px' }"
    >
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column
        prop="id"
        label="ID"
        width="80"
        sortable
      ></el-table-column>
      <el-table-column prop="name" label="名称"></el-table-column>
      <el-table-column prop="info" label="简介"></el-table-column>
      <el-table-column label="图片"
        ><template slot-scope="scope"
          ><el-image
            style="width: 100px; height: 100px"
            :src="scope.row.img"
            :preview-src-list="[scope.row.img]"
          ></el-image></template
      ></el-table-column>
      <el-table-column prop="userId" label="预约用户id"></el-table-column>
      <el-table-column prop="userName" label="预约用户名称"></el-table-column>
      <el-table-column
        prop="state"
        label="是否预约"
        align="center"
      ></el-table-column>

      <el-table-column label="操作" width="180" align="center">
        <template slot-scope="scope">
          <div class="table-row-options-warp">
            <el-button @click="cancel(scope.row.id)">取消预约</el-button>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="管理" width="180" align="center">
        <template slot-scope="scope">
          <div class="table-row-options-warp">
            <span @click="handleEdit(scope.row)">编辑 </span>
            <el-popconfirm
              class="ml-5"
              confirm-button-text="确定"
              cancel-button-text="取消"
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除这条数据吗？"
              @confirm="del(scope.row.id)"
            >
              <span slot="reference">删除</span>
            </el-popconfirm>
          </div>
        </template>
      </el-table-column>
    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="pageNum"
        :page-sizes="[2, 5, 10, 20]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      >
      </el-pagination>
    </div>

    <el-dialog
      title="信息"
      :visible.sync="dialogFormVisible"
      width="40%"
      :close-on-click-modal="false"
    >
      <el-form
        label-width="140px"
        size="small"
        style="width: 85%"
        :model="form"
        :rules="rules"
        ref="ruleForm"
      >
        <el-form-item prop="name" label="名称">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="info" label="简介">
          <el-input v-model="form.info" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="img" label="座位照片">
          <el-upload
            action="http://localhost:9090/file/upload"
            ref="img"
            :on-success="handleImgUploadSuccess"
          >
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'Seat',
  props: {
    themeStatus: Number,
  },
  data() {
    return {
      themes: [
        'theme1',
        'theme2',
        'theme3',
        'theme4',
        'theme5',
        'theme6',
        'theme7',
        'theme8',
      ],
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: '',
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      user: localStorage.getItem('user')
        ? JSON.parse(localStorage.getItem('user'))
        : {},
      rules: {
        name: [{ required: true, message: '请输入名称', trigger: 'blur' }],
      },
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request
        .get('/seat/page', {
          params: {
            pageNum: this.pageNum,
            pageSize: this.pageSize,
            name: this.name,
          },
        })
        .then((res) => {
          this.tableData = res.data.records
          this.total = res.data.total
        })
    },
    cancel(id) {
      this.request.get('/seat/cancel/' + id).then((res) => {
        if (res.code === '200') {
          this.load()
          this.$message.success('取消预约成功')
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          this.request.post('/seat', this.form).then((res) => {
            if (res.code === '200') {
              this.$message.success('保存成功')
              this.dialogFormVisible = false
              this.load()
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
      this.$nextTick(() => {
        if (this.$refs.img) {
          this.$refs.img.clearFiles()
        }
        if (this.$refs.file) {
          this.$refs.file.clearFiles()
        }
      })
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
      this.$nextTick(() => {
        if (this.$refs.img) {
          this.$refs.img.clearFiles()
        }
        if (this.$refs.file) {
          this.$refs.file.clearFiles()
        }
      })
    },
    del(id) {
      this.request.delete('/seat/' + id).then((res) => {
        if (res.code === '200') {
          this.$message.success('删除成功')
          this.load()
        } else {
          this.$message.error('删除失败')
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    delBatch() {
      if (!this.multipleSelection.length) {
        this.$message.error('请选择需要删除的数据')
        return
      }
      let ids = this.multipleSelection.map((v) => v.id) // [{}, {}, {}] => [1,2,3]
      this.request.post('/seat/del/batch', ids).then((res) => {
        if (res.code === '200') {
          this.$message.success('批量删除成功')
          this.load()
        } else {
          this.$message.error('批量删除失败')
        }
      })
    },
    reset() {
      this.name = ''
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    handleFileUploadSuccess(res) {
      this.form.file = res
    },
    handleImgUploadSuccess(res) {
      this.form.img = res
    },
    download(url) {
      window.open(url)
    },
    exp() {
      window.open('http://localhost:9090/seat/export')
    },
  },
}
</script>

<style scoped>
.el-button:focus,
.el-button:hover {
  background: var(--font-color-primary);
  border-color: var(--font-color-primary);
  border-color: var(--back-color-primary);
  color: #fff;
}

.el-button--primary {
  color: var(--font-color-primary);
  background-color: var(--back-color-primary);
  border-color: var(--back-color-primary);
}

.el-button--primary:focus,
.el-button--primary:hover {
  background: var(--font-color-primary);
  border-color: var(--font-color-primary);
  border-color: var(--back-color-primary);
  color: #fff;
}

.el-button--danger {
  color: rgb(214, 48, 49);
  background-color: rgb(214, 48, 49, 0.1);
  border-color: rgb(214, 48, 49, 0.1);
}

.el-button--danger:focus,
.el-button--danger:hover {
  background: rgb(214, 48, 49);
  border-color: rgb(214, 48, 49);
  border-color: rgb(214, 48, 49, 0.1);
  color: #fff;
}

.table-row-options-warp span {
  cursor: pointer;
  color: var(--font-color-primary);
}
.table-row-options-warp span:last-child {
  cursor: pointer;
  color: #d63031;
}
</style>
