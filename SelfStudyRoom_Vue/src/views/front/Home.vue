<template>
  <div>
    <!-- 轮播图、公告 -->
    <el-row :gutter="24" style="margin-top: 20px">
      <el-col :span="8">
        <el-card style="width: 80%">
          <h2 style="margin: 20px 0">公告列表</h2>
          <div>
            <el-timeline reverse slot="reference">
              <el-timeline-item
                v-for="item in notices"
                :key="item.id"
                :timestamp="item.time"
              >
                <el-popover
                  placement="right"
                  width="200"
                  trigger="hover"
                  :content="item.content"
                >
                  <span slot="reference">{{ item.name }}</span>
                </el-popover>
              </el-timeline-item>
            </el-timeline>
          </div>
        </el-card>
      </el-col>
      <el-col :span="16">
        <el-carousel height="500px" :interval="2000">
          <el-carousel-item v-for="item in imgs" :key="item">
            <img :src="item" style="width: 100%; height: 100%" />
          </el-carousel-item>
        </el-carousel>
      </el-col>
    </el-row>

    <el-row :gutter="24">
      <el-table
        :data="tableData"
        stripe
        style="border-radius: 10px; margin-top: 30px; line-height: 30px"
      >
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
        <el-table-column prop="state" label="是否预约" align="center">
          <template slot-scope="scope">
            <div
              :style="{ color: scope.row.state == '否' ? 'blue' : 'orangered' }"
            >
              {{ scope.row.state }}
            </div>
          </template>
        </el-table-column>
        <el-table-column
          prop="userName"
          label="预约用户"
          align="center"
        ></el-table-column>
        <el-table-column label="操作" width="180" align="center">
          <template slot-scope="scope">
            <el-button type="success" @click="order(scope.row.id)"
              >预 约</el-button
            >
            <el-button
              @click="cancel(scope.row.id)"
              v-if="scope.row.userId === user.id"
              >取消预约</el-button
            >
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
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'FrontHome',
  data() {
    return {
      notices: [],
      tableData: [],
      user: localStorage.getItem('user')
        ? JSON.parse(localStorage.getItem('user'))
        : {},
      total: 0,
      pageNum: 1,
      pageSize: 10,
      imgs: [
        'https://img.zcool.cn/community/018fd45d2ed0f5a80120695c6fe1a1.jpg@1280w_1l_2o_100sh.jpg',
        'https://imgs.699pic.com/images/600/039/608.jpg!detail.v1',
        'http://paper.people.com.cn/rmrbhwb/res/1/20191107/1573066907150_1.jpg',
      ],
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get('/notice').then((res) => {
        this.notices = res?.data
      })
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
    order(id) {
      this.request.get('/seat/order/' + id).then((res) => {
        if (res.code === '200') {
          this.load()
          this.$message.success('预约成功')
        } else {
          this.$message.error(res.msg)
        }
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
    handleSizeChange(pageSize) {
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      this.pageNum = pageNum
      this.load()
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
  },
}
</script>

<style></style>
