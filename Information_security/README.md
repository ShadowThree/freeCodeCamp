## 说明
1. 本 `Repo` 是针对 [FreeCodeCamp: Information Security](https://www.freecodecamp.org/learn/information-security/) 课程的说明。
2. 在以下各课程操作步骤中，若程序在运行之前已经处于运作状态了，需要 `Ctrl-C Y` 先停止程序，再 `npm start` 重新开始运行。

## 课程详解
### Lesson1
> 参考链接：[How to Run the freeCodeCamp Backend Challenges Locally](https://www.freecodecamp.org/news/how-to-run-the-freecodecamp-backend-challenges-locally/)
1. 下载模板工程：`git clone https://github.com/freeCodeCamp/boilerplate-infosec.git`
2. 进入到模板工程路径：`cd boilerplate-infosec`
3. 下载依赖的各种资源：`npm install`
4. (可选)根据下载的提示，修复漏洞：`npm audit fix`
5. 运行：`npm start`
6. 查看运行结果：在浏览器地址栏输入：`http://localhost:3000`
7. 提交结果：在 [本课程页面](https://www.freecodecamp.org/learn/information-security/information-security-with-helmetjs/install-and-require-helmet) 的 `Solution Link` 中输入 `http://localhost:3000` 并确认。

### Lesson2
1. 将 `boilerplate-infosec/myApp.js` 修改如下：
```js
const express = require('express');
const helmet = require('helmet');
const app = express();
app.use(helmet.hidePoweredBy());
```
2. 运行：`npm start`
3. 查看运行结果：在浏览器地址栏输入：`http://localhost:3000`
4. 提交结果：在 [本课程页面](https://www.freecodecamp.org/learn/information-security/information-security-with-helmetjs/hide-potentially-dangerous-information-using-helmet-hidepoweredby) 的 `Solution Link` 中输入 `http://localhost:3000` 并确认。