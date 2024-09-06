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
            <div class="message-footer">
              <!-- 删除按钮，绑定点击事件，传递 message.id -->
              <el-button
                type="danger"
                size="mini"
                @click="deleteMessage(message.id)"
                >删除</el-button
              >
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
        if (response.code === '200') {
          // 处理返回的留言数据
          this.messages = response.data.map((message) => ({
            ...message,
            createdAt: this.convertArrayToDate(message.createdAt),
            updatedAt: this.convertArrayToDate(message.updatedAt),
          }))
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
    async deleteMessage(id) {
      try {
        const confirm = await this.$confirm('确定要删除这条留言吗?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
        })
        console.log('id:', id)
        if (confirm) {
          const response = await request.delete(
            `/api/message-board/delete/${id}`
          )
          if (response.code === '200') {
            this.$message.success('删除成功')
            this.fetchMessages() // 重新获取留言列表
          } else {
            this.$message.error('删除失败: ' + response.msg)
          }
        }
      } catch (error) {
        if (error !== 'cancel') {
          console.error('Error deleting message:', error)
          this.$message.error('删除失败')
        }
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
  margin-bottom: 10px;
}

.message-footer {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.message-username {
  margin-right: 10px;
}
</style>
