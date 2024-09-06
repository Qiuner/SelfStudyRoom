<!-- 项目登录文件 -->
<template>
  <div class="wrapper">
    <div
      style="
        height: 60px;
        line-height: 60px;
        font-size: 20px;
        padding-left: 50px;
        color: white;
        background-color: rgba(0, 0, 0, 0.2);
      "
    >
      自习室座位预约系统
    </div>
    <div
      style="
        margin: 150px auto;
        background-color: #ffffff;
        width: 800px;
        height: 387px;
        padding: 20px;
        border-radius: 20px;
      "
    >
      <!--      <div id="myBox">-->

      <div id="myImg" style="margin: 0px"></div>
      <div id="loadStyle">
        <div style="margin: 20px 0; text-align: center; font-size: 24px">
          <b>登 录</b>
        </div>
        <el-form :model="user" :rules="rules" ref="userForm">
          <el-form-item prop="username">
            <el-input
              size="medium"
              prefix-icon="el-icon-user"
              v-model="user.username"
            ></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input
              size="medium"
              prefix-icon="el-icon-lock"
              show-password
              v-model="user.password"
            ></el-input>
          </el-form-item>

          <el-form-item
            style="display: flex; margin: 10px 0; text-align: right"
          >
            <el-button
              id="mybutton"
              round
              type="primary"
              size="small"
              autocomplete="off"
              @click="login"
              >登录
            </el-button>
            <hr
              style="
                width: 230px;
                margin: 10px auto 5px;
                background-color: #d5d5d5;
                height: 1px;
                border: none;
              "
            />
          </el-form-item>
          <el-form-item style="margin: 10px 0; text-align: left">
            <el-button
              style="margin-left: 30px; color: #6c99d2"
              type="text"
              size="mid"
              autocomplete="off"
              @click="$router.push('/register')"
              >前往注册
            </el-button>
            <el-button
              style="float: right; margin-right: 30px; color: #6c99d2"
              type="text"
              size="mid"
              autocomplete="off"
              @click="handlePass"
              >找回密码
            </el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>

    <!--    </div>-->

    <el-dialog title="找回密码" :visible.sync="dialogFormVisible" width="30%">
      <el-form label-width="100px" size="small">
        <el-form-item label="用户名">
          <el-input v-model="pass.username" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号">
          <el-input v-model="pass.phone" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="passwordBack">重置密码</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { resetRouter, setRoutes } from '@/router'
import Identify from '@/components/Identify'

export default {
  name: 'Login',
  data() {
    return {
      user: {},
      pass: {},
      code: '',
      dialogFormVisible: false,
      // 图片验证码
      identifyCode: '',
      // 验证码规则
      identifyCodes: '3456789ABCDEFGHGKMNPQRSTUVWXY',
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 10, message: '长度在 3 到 5 个字符', trigger: 'blur' },
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          {
            min: 1,
            max: 20,
            message: '长度在 1 到 20 个字符',
            trigger: 'blur',
          },
        ],
      },
    }
  },
  components: { Identify },
  mounted() {
    // 重置路由
    resetRouter()
    this.refreshCode()
  },
  methods: {
    login() {
      if (this.code !== this.identifyCode.toLowerCase()) {
        this.$message({
          type: 'error',
          message: '验证码错误',
        })
        return
      }
      this.$refs['userForm'].validate((valid) => {
        if (valid) {
          // 表单校验合法
          this.request.post('/user/login', this.user).then((res) => {
            if (res.code === '200') {
              localStorage.setItem('user', JSON.stringify(res.data)) // 存储用户信息到浏览器
              localStorage.setItem('menus', JSON.stringify(res.data.menus)) // 存储用户信息到浏览器

              // 动态设置当前用户的路由
              setRoutes()
              if (res.data.role === 'ROLE_USER') {
                this.$router.push('/front/Home')
                this.$message.success('登录成功')
              } else {
                this.$router.push('/')
                this.$message.success('登录成功')
              }
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      })
    },
    // // 切换验证码 这里原本想做 但后面感觉没必要就没做验证码了
    // refreshCode() {
    //   this.identifyCode = ''
    //   this.makeCode(this.identifyCodes, 4)
    // },
    // // 生成随机验证码
    // makeCode(o, l) {
    //   for (let i = 0; i < l; i++) {
    //     this.identifyCode += this.identifyCodes[Math.floor(Math.random() * (this.identifyCodes.length))]
    //   }
    // },
    handlePass() {
      this.dialogFormVisible = true
      this.pass = {}
    },
    passwordBack() {
      this.request.put('/user/reset', this.pass).then((res) => {
        if (res.code === '200') {
          this.$message.success('重置密码成功，新密码为：123，请尽快修改密码')
          this.dialogFormVisible = false
        } else {
          this.$message.error(res.msg)
        }
      })
    },
  },
}
</script>

<style scoped>
.wrapper {
  height: 100vh;
  /*background-image: url("../assets/bg.jpg");*/
  background-color: #b47840;
  background-size: cover;
  overflow: hidden;
}

#myBox {
  margin: 0px;
  padding: 0px;
  /*height: 400px;*/
  /*width: 800px;*/
  /*border: #67C23A 1px solid;*/
}

#myImg {
  width: 350px;
  height: 350px;
  /*border: #1E90FF 1px solid;*/
  border-radius: 10px;
  float: left;
  background-color: #ffe0d2;
  background-image: url('../assets/login.png');
  background-position: center;
  background-size: cover;
}

#loadStyle {
  /*border: #1E90FF 1px solid;*/
  width: 350px;
  height: 350px;
  float: right;

  margin-right: 20px;
}

#mybutton {
  width: 280px;
  height: 40px;
  background-color: #69615e;
  margin: 10px 34px;
  border: none;
}

#mybutton:hover {
  background-color: black;
}
</style>
