<template>
  <el-col :span="12">
    <el-card style="width: 100%">
      <h2 style="margin: 20px 0">留言板</h2>
      <div>
        <el-input
          type="textarea"
          v-model="messageContent"
          placeholder="请输入您的留言"
          rows="4"
        ></el-input>
        <el-button
          type="primary"
          style="margin-top: 10px"
          @click="submitMessage"
          >提交留言</el-button
        >
      </div>
      <!-- 显示留言列表 -->
      <div style="margin-top: 20px">
        <el-timeline>
          <el-timeline-item
            v-for="message in messages"
            :key="message.id"
            :timestamp="formatDate(message.createdAt)"
            style="margin-bottom: 10px"
          >
            <div class="message-content">
              <small class="message-username">
                {{ message.nickname }} 留言：
              </small>
              {{ message.content }}
            </div>
          </el-timeline-item>
        </el-timeline>
      </div>
    </el-card>
  </el-col>
</template>

<script>
import request from '@/utils/request'

export default {
  data() {
    return {
      messageContent: '',
      messages: [],
    }
  },
  created() {
    this.fetchMessages()
  },
  methods: {
    async fetchMessages() {
      try {
        const response = await request.get('/api/message-board/list')
        console.log('Response data:', response)

        if (response.code === '200') {
          // 将收到的留言数据中的日期数组转换为 Date 对象
          this.messages = response.data.map((message) => ({
            ...message,
            createdAt: this.convertArrayToDate(message.createdAt),
            updatedAt: this.convertArrayToDate(message.updatedAt),
          }))
          console.log('刷新成功')
        } else {
          this.$message.error('获取留言列表失败: ' + response.msg)
        }
      } catch (error) {
        console.error('Error fetching messages:', error)
        this.$message.error('获取留言列表失败')
      }
    },
    async submitMessage() {
      if (!this.messageContent.trim()) {
        this.$message.error('留言内容不能为空')
        return
      }
      try {
        const response = await request.post('/api/message-board/add', {
          content: this.messageContent,
          nickname: '当前昵称',
        })
        if (response.code === '200') {
          this.$message.success('留言成功')
          this.messageContent = ''
          this.fetchMessages() // 刷新留言列表
        } else {
          this.$message.error('留言失败: ' + response.msg)
        }
      } catch (error) {
        console.error('Error submitting message:', error)
        this.$message.error('留言失败')
      }
    },
    formatDate(date) {
      const options = {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
      }
      return date.toLocaleDateString('zh-CN', options)
    },
    convertArrayToDate(dateArray) {
      // 将数组 [2024, 8, 23, 23, 55, 3] 转换为 Date 对象
      return new Date(
        dateArray[0], // year
        dateArray[1] - 1, // month (0-based index)
        dateArray[2], // day
        dateArray[3], // hour
        dateArray[4], // minute
        dateArray[5] // second
      )
    },
  },
}
</script>

<style scoped>
.message-content {
  margin-bottom: 10px; /* 留言内容与用户名/时间之间的间距 */
}

.message-footer {
  display: flex;
  justify-content: space-between; /* 在行内两端对齐 */
  align-items: center;
  color: gray;
}

.message-username {
  margin-right: 10px; /* 用户名和时间之间的间距 */
}
</style>
