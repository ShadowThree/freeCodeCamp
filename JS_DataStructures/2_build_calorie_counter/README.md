## 说明
1. `freeCodeCamp` --> `JavaScript Algorithms and Data Structures(Beta)` --> `Build a Calorie Counter`;

## 课程详细步骤
### `index.html`
1. `form`在`HTML`中插入表格；
2. `label`在`HTML`中新建标签，`label`有一个`for`属性：
> The `for` attribute specifies which form element a label is bound to.
> Syntax: <label for="element_id"> 
3. `input`标签用于获取用户输入；
> [参考](https://www.w3schools.com/html/html_form_input_types.asp)
> `type`用于指定输入类型；`min`限定可输入的最小值；`id`用于和相对应的`label`绑定；`placeholder`指定在输入框的提示词；`required`表示必填项；
4. `fieldset`标签用于指定一块区域，其内部的`legend`标签用于命名这块区域；
5. `select`标签创建一个下拉框，其内部的`option`用于创建这个下拉框中的选项；`option`中的`selected`用于指定默认选中项；
6. 同一个标签可以指定两个`class`: `<div class="class1 class2"></div>`;
7. [参考：`button`标签](https://www.w3schools.com/tags/tag_button.asp)
8. `<hr>`标签用于添加分割线；(此标签不需要闭合)

### `script.js`
1. 通过`document.getElementById('id');`在`js`文件中获取`html`元素；
> [参考：`querySelector()`和`getElementById()`的区别](https://dev.to/colelevy/queryselector-vs-getelementbyid-166n)
> `getElementById()`能通过唯一的`id`确定唯一的元素；`querySelector()`能返回找到的第一个元素；`querySelectorAll()`能返回符合条件的所有元素；后两个可以同时指定多个条件用于更准确的描述某一个元素；
> `document.querySelectorAll()`返回的是一个`array-like`对象，可以通过`Array.from()`转换成一个`array`;
2. `str.split()`可以将字符串按指定字符拆分成字符串数组并返回；`str.split('')`直接将字符串拆分成字符数组并返回；
3. `js`中的正则表达式包含在一对正斜杠中`//`，比如：`/\+-\s/`:
> `\s`: 匹配所有空白字符；
> `\+`: 匹配加号，因为`+`在正则表达式中表示匹配多次，所以需要`\`转义；
> `//`后可以加特殊的标志控制其匹配行为；比如`//g`表示全局匹配；`//i`表示忽略大小写匹配；
> `\d`和`[0-9]`等效，都表示匹配数字；
4. `str.replace()`可以替换`str`中指定的字串，第一个参数可以是字符串，也可以是正则表达式；第二个参数指定要替换成什么字符串；
5. `str.match(regex)`可以将`str`中匹配`regex`的结果返回；
6. 字符串中使用变量：`\`Hello, ${varName}!\``(必须使用反引号);
7. `innerText`设置元素的文本, `innerHTML`给指定标签添加`HTML`, `insertAdjacentHTML()`给指定标签添加`HTML`且能保留用户之前的输入;
8. `element.classList.remove('className');`, `element.classList.add('className');`可以动态增删一个元素的`class`;
9. `preventDefault()`可以阻止提交按钮对表格的提交；也可以阻止对指定连接的访问；
10. `str.toLowerCase()`可以将字符串转成小写；`Math.abs()`求绝对值；
11. `alert()`用于显示一个提示框；
12. `button.addEventListener('click', bntClickEvent);`用于按钮和事件绑定；
> [`button.onclick()`和`button.addEventListener()`的区别](https://www.geeksforgeeks.org/difference-between-addeventlistener-and-onclick-in-javascript/)

### `styles.css`
1. 可以在`.root{ varName: varValue; }`中设置变量，通过`var(varName)`引用；

