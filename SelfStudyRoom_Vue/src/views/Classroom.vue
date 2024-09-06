<template>
  <div :class="`${themes[themeStatus]}`">
    <div style="margin: 10px 0">
      <el-input
        style="width: 200px"
        placeholder="请输入名称"
        suffix-icon="el-icon-search"
        v-model="name"
      ></el-input>
      <el-button class="ml-5" plain type="primary" @click="load">
        搜索
      </el-button>
      <el-button type="info" plain @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-button type="primary" plain @click="handleAdd">
        新增 <i class="el-icon-circle-plus-outline"></i>
      </el-button>
      <el-popconfirm
        class="ml-5"
        confirm-button-text="确定"
        cancel-button-text="我再想想"
        icon="el-icon-info"
        icon-color="red"
        title="您确定批量删除这些数据吗？"
        @confirm="delBatch"
      >
        <el-button type="danger" plain slot="reference">
          批量删除 <i class="el-icon-remove-outline"></i>
        </el-button>
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
      <el-table-column prop="location" label="位置"></el-table-column>
      <el-table-column prop="details" label="详细描述"></el-table-column>
      <el-table-column
        prop="totalSeats"
        label="座位总数"
        align="center"
      ></el-table-column>
      <el-table-column
        prop="occupiedSeats"
        label="已选座位"
        align="center"
      ></el-table-column>

      <el-table-column label="操作" width="180" align="center">
        <template slot-scope="scope">
          <div class="table-row-options-warp">
            <el-button @click="handleEdit(scope.row)">编辑</el-button>
            <el-popconfirm
              class="ml-5"
              confirm-button-text="确定"
              cancel-button-text="取消"
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除这条数据吗？"
              @confirm="del(scope.row.id)"
            >
              <el-button type="danger" plain slot="reference">删除</el-button>
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
      title="教室信息"
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
        <el-form-item prop="location" label="位置">
          <el-input v-model="form.location" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="details" label="详细描述">
          <el-input v-model="form.details" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="totalSeats" label="座位总数">
          <el-input
            type="number"
            v-model="form.totalSeats"
            autocomplete="off"
          ></el-input>
        </el-form-item>
        <el-form-item prop="occupiedSeats" label="已选座位">
          <el-input
            type="number"
            v-model="form.occupiedSeats"
            autocomplete="off"
          ></el-input>
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
import request from '@/utils/request' // 确保你正确引入了axios实例

export default {
  name: 'Classroom',
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
      rules: {
        name: [{ required: true, message: '请输入名称', trigger: 'blur' }],
        location: [{ required: true, message: '请输入位置', trigger: 'blur' }],
        totalSeats: [
          { required: true, message: '请输入座位总数', trigger: 'blur' },
        ],
      },
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      request
        .get('/classroom/page', {
          params: {
            pageNum: this.pageNum,
            pageSize: this.pageSize,
            name: this.name,
          },
        })
        .then((res) => {
          if (res.code === '200') {
            this.tableData = res.data.records || [] // Ensure proper data extraction
            this.total = res.data.total || 0 // Ensure proper data extraction
          } else {
            this.$message.error(res.msg || '加载失败')
          }
        })
        .catch(() => {
          this.$message.error('加载失败')
        })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
    },
    handleEdit(row) {
      this.form = { ...row }
      this.dialogFormVisible = true
    },
    save() {
      this.$refs.ruleForm.validate((valid) => {
        if (valid) {
          request.post('/classroom', this.form).then((res) => {
            if (res.code === '200') {
              this.$message.success('保存成功')
              this.dialogFormVisible = false
              this.load()
            } else {
              this.$message.error(res.msg || '保存失败')
            }
          })
        }
      })
    },
    del(id) {
      request.delete(`/classroom/${id}`).then((res) => {
        if (res.code === '200') {
          this.$message.success('删除成功')
          this.load()
        } else {
          this.$message.error(res.msg || '删除失败')
        }
      })
    },
    delBatch() {
      if (!this.multipleSelection.length) {
        this.$message.error('请选择需要删除的数据')
        return
      }
      let ids = this.multipleSelection.map((v) => v.id)
      request
        .delete('/classroom/batch', {
          data: ids,
        })
        .then((res) => {
          if (res.code === '200') {
            this.$message.success('批量删除成功')
            this.load()
          } else {
            this.$message.error(res.msg || '批量删除失败')
          }
        })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    reset() {
      this.name = ''
      this.load()
    },
    handleSizeChange(pageSize) {
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      this.pageNum = pageNum
      this.load()
    },
  },
}
</script>

<style scoped>
.el-button:focus,
.el-button:hover {
  background: var(--font-color-primary);
  border-color: var(--font-color-primary);
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
  color: #fff;
}

.table-row-options-warp span {
  cursor: pointer;
  color: var(--font-color-primary);
}
.table-row-options-warp span:last-child {
  color: #d63031;
}
</style>
