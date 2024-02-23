## 说明
1. 此目录是针对 [FreeCodeCamp: JavaScript Algorithms and Data Structures(Beta) Certification](https://www.freecodecamp.org/learn/javascript-algorithms-and-data-structures-v8/) 课程的说明。
2. 在本课程中，可以直接将内容输入到网页上；你也可以在本地新建相应的文件并键入相同代码，查看效果；

## 课程详解
### Lesson1
1. 新建一个 [DragonRepeller.html](./DragonRepeller.html) 并输入以下内容：
```html
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="./styles.css">
	<title>RPG - Dragon Repeller</title>
</head>

<body>
	<div id="game">
	</div>
</body>

</html>
```
2. 在网页端输入以上代码并提交；

### Lesson2
1. 在以上代码的 `head`结尾加上 `script` 标签，用于插入 `javascript` 代码：
```html
<script>
</script>
```
2. 在网页端输入以上代码并提交；

### Lesson3
1. 在 `script` 标签中插入 `javascript` 日志代码：
```html
<script>
	console.log("Hello World");
</script>
```
2. 双击 `DragonRepeller.html` 文件，会在浏览器打开；按 `F12` 或者 `Ctrl+Shift+I` 打开前端调试页面，选择 `Console` 就可以看到网页输出的日志了。
![网页调试](./res/L3_debug.png)
3. 发现上面图片有一个 `Failed to load resource` 的错误，这是由于这个 `DragonRepeller.html` 引用了一个 `styles.css` 文件，再新建一个 `styles.css` 文件就可以了。

### Lesson4-5
1. 为了让文件更便于管理，将 `javascript` 代码放到一个单独的文件中；新建一个 `script.js` 文件，并通过以下方式引入：
```html
<script src="./script.js">
</script>
```

### Lesson6-14
1. `javascript` 变量命名方式为驼峰法，比如：`thisIsCamelCase`, `currentWeapon`;
2. 每行以分号 `;` 结束;
3. 字符串需要包含在双引号("")、单引号('')、反引号(\`\`)中；
4. 数组的定义：`let array = ["str1", "str2", "str3"];

### Lesson15-18
1. `div` 元素用于指定 `CSS` 风格；
2. `span` 元素用于设置文本颜色；
3. `strong` 用于加粗字体；
4. `button` 用于产生按钮；

### Lesson19-20
1. `Javascript` 通过 `Document Object Model(DOM)` 和 `HTML` 进行交互；
> JavaScript interacts with the HTML using the Document Object Model, or DOM. The DOM is a tree of objects that represents the HTML. You can access the HTML using the `document` object, which represents your entire HTML document.
2. `document.querySelector()` 用于指定 `HTML` 中特定的元素；
> One method for finding specific elements in your HTML is using the `querySelector()` method. The `querySelector()` method takes a CSS selector as an argument and returns the first element that matches that selector.
> Remember that CSS id selectors are prefixed with a `#`.
3. `HTML` 中导入 `javascript` 脚本时，必须放在最后(`</body>`前面)，这样才能保证在执行脚本时，浏览器已经读取了整个 `HTML` 文件；

### Lesson21-24
1. 不需要重新赋值的变量，通过 `const` 声明；
2. `const` 变量被修改时，`JS` 会报异常；

### Lesson25-32
1. 在 `styles.css` 中输入样式代码；
2. `CSS` 文件中的`选择器`: 引用`id`时，`id`名前需要加`#`；引用`class`时，需要在`class`前面加`.`；引用`element`时，只需`element`名就行；
3. `CSS`中可以用选择器列表，同时给两个对象定义相同的样式；
4. `CSS`中，通过属性 `display: none;` 可以隐藏指定的对象不显示；
5. `CSS`中，通过属性 `cursor: pointer;` 可以设置鼠标为手性图标；
