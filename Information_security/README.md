## 说明
1. 本 `Repo` 是针对 [FreeCodeCamp: Information Security](https://www.freecodecamp.org/learn/information-security/) 课程的说明。
2. 在以下各课程操作步骤中，若程序在运行之前已经处于运作状态了，需要 `Ctrl-C Y` 先停止程序，再 `npm start` 重新开始运行。

## 课程详解
### Lesson1 (Install and Require Helmet)
> 参考链接：[How to Run the freeCodeCamp Backend Challenges Locally](https://www.freecodecamp.org/news/how-to-run-the-freecodecamp-backend-challenges-locally/)
1. 下载模板工程：`git clone https://github.com/freeCodeCamp/boilerplate-infosec.git`
2. 进入到模板工程路径：`cd boilerplate-infosec`
3. 下载依赖的各种资源：`npm install`
4. (可选)根据下载的提示，修复漏洞：`npm audit fix`
5. 运行：`npm start`
6. 查看运行结果：在浏览器地址栏输入：`http://localhost:3000`
7. 提交结果：在 [本课程页面](https://www.freecodecamp.org/learn/information-security/information-security-with-helmetjs/install-and-require-helmet) 的 `Solution Link` 中输入 `http://localhost:3000` 并确认。

### Lesson2 (Hide Potentially Dangerous Information Using helmet.hidePoweredBy())
1. 将 `boilerplate-infosec/myApp.js` 的头几行修改如下：
```js
const express = require('express');
const helmet = require('helmet');
const app = express();
app.use(helmet.hidePoweredBy());
```
2. 运行：`npm start`
3. 查看运行结果：在浏览器地址栏输入：`http://localhost:3000`
4. 提交结果：在 [本课程页面](https://www.freecodecamp.org/learn/information-security/information-security-with-helmetjs/hide-potentially-dangerous-information-using-helmet-hidepoweredby) 的 `Solution Link` 中输入 `http://localhost:3000` 并确认。

### Lesson3 (Mitigate the Risk of Clickjacking with helmet.frameguard())
1. 将 `boilerplate-infosec/myApp.js` 的头几行修改如下：
```js
const express = require('express');
const helmet = require('helmet');
const app = express();
app.use(helmet.hidePoweredBy());
app.use(helmet.frameguard({action: 'deny'}));
```
2. 运行：`npm start`
3. 查看运行结果：在浏览器地址栏输入：`http://localhost:3000`
4. 提交结果：在 [本课程页面](https://www.freecodecamp.org/learn/information-security/information-security-with-helmetjs/mitigate-the-risk-of-clickjacking-with-helmet-frameguard) 的 `Solution Link` 中输入 `http://localhost:3000` 并确认。 

### Lesson4 (Mitigate the Risk of Cross Site Scriping(XSS) Attacks with helmet.xssFilter())
1. 将 `boilerplate-infosec/myApp.js` 的头几行修改如下：
```js
const express = require('express');
const helmet = require('helmet');
const app = express();
app.use(helmet.hidePoweredBy());
app.use(helmet.frameguard({action: 'deny'}));
app.use(helmet.xssFilter({}));
```
2. 运行：`npm start`
3. 查看运行结果：在浏览器地址栏输入：`http://localhost:3000`
4. 提交结果：在 [本课程页面](https://www.freecodecamp.org/learn/information-security/information-security-with-helmetjs/mitigate-the-risk-of-cross-site-scripting-xss-attacks-with-helmet-xssfilter) 的 `Solution Link` 中输入 `http://localhost:3000` 并确认。 

### Lesson5 (Avoid Inferring the Response MIME Type with helmet.noSniff())
1. 将 `boilerplate-infosec/myApp.js` 在前面的基础上，添加如下代码：
```js
app.use(helmet.noSniff());
```
2. 按之前步骤，运行并提交结果。

### Lesson6 (Prevent IE from Opening Untrusted HTML with helmet.ieNoOpen())
1. 将 `boilerplate-infosec/myApp.js` 在前面的基础上，添加如下代码：
```js
app.use(helmet.ieNoOpen());
```
2. 按之前步骤，运行并提交结果。

### Lesson7 (Ask Browsers to Access Your Site via HTTPS Only with helmet.hsts())
1. 将 `boilerplate-infosec/myApp.js` 在前面的基础上，添加如下代码：
```js
var timeInSec = 90 * 24 * 60 * 60;
app.use(helmet.hsts({ maxAge: timeInSec, force: true }));
```
2. 按之前步骤，运行并提交结果。

### Lesson8 (Disable DNS Prefetching with helmet.dnsPrefetchControl())
1. 将 `boilerplate-infosec/myApp.js` 在前面的基础上，添加如下代码：
```js
app.use(helmet.dnsPrefetchControl());
```
2. 按之前步骤，运行并提交结果。

### Lesson9 (Disable Client-Side Cashing with helmet.noCache())
1. 将 `boilerplate-infosec/myApp.js` 在前面的基础上，添加如下代码：
```js
app.use(helmet.noCache());
```
2. 按之前步骤，运行并提交结果。

### Lesson10 (Set a Content Security Policy with helmet.contentSecurityPolicy())
1. 将 `boilerplate-infosec/myApp.js` 在前面的基础上，添加如下代码：
```js
app.use(helmet.contentSecurityPolicy({ directives: { defaultSrc: ["'self'"], scriptSrc: ["'self'", "trusted-cdn.com"] } }));
```
2. 按之前步骤，运行并提交结果。

### Lesson11 (Configure Helmet Using the 'parent' helmet() Middleware)
1. 介绍了 `app.use(helmet());`

### Lesson12 (Understand BCrypt Hashes)
> 注意：这里使用的新的工程模板，和上面课程的模板不一样了！！！
1. 在 `freeCodeCamp/Information_security` 目录下，执行 `git clone https://github.com/freeCodeCamp/boilerplate-bcrypt.git` 下载工程模板；
2. 检查 `package.json` 文件中是否有 `"bcrypt": "5.0.1"`(模板工程中应该已经有了)；
3. 在 `server.js` 中加上 `const bcrypt = require('bcrypt');` 导入 `bcrypt` 库；
4. 运行 `npm install` 安装依赖库；
5. 运行 `npm audit fix --force` 修复漏洞；
6. 运行 `npm start` 启动 `APP`;
7. 按之前的步骤，提交结果。

### Lesson13 (Hash and Compare Passwords Asynchronously)
1. 在 `server.js` 的 `ASYNC` 注释区间加上如下代码：
```js
//START_ASYNC -do not remove notes, place code between correct pair of notes.
bcrypt.hash(myPlaintextPassword, saltRounds, (err, hash) => {
    console.log(hash);
    bcrypt.compare(myPlaintextPassword, hash, (err, res) => {
        console.log(res);
    });
});
//END_ASYNC
```
2. 按之前步骤，运行并提交结果。

### Lesson14 (Hash and Compare Passwords Synchronously)
1. 在 `server.js` 的 `SYNC` 注释区间加上如下代码：
```js
//START_SYNC
let hash = bcrypt.hashSync(myPlaintextPassword, saltRounds);
console.log(hash);
let result = bcrypt.compareSync(myPlaintextPassword, hash);
console.log(result);
//END_SYNC
```
2. 按之前步骤，运行并提交结果。