Xpath (XML Path Language)，是W3C定义的用来在XML文档中选择节点的语言

# 从根目录/开始

有点像Linux的文件查看，/代表根目录，一级一级的查找，直接子节点，相当于css_selector中的>号

/html/body/div/p 

 

# 根据元素属性选择：

查找具体的元素，必须在前面输入标准开头//，表示从当前节点寻找所有的后代元素

//div/*     div下面的所有的元素

//div//p     先在整个文档里查找div，再在div里查找p节点(只要在内部，不限定是否紧跟) ；等价于 css_selector里的('div p')

//div/p      p是div的直接子节点； 等价于 css_selector里的('div > p')

//*[@style]   查找所有包含style的所有元素，所有的属性要加@；  等价于 css_selector里的('*[style]')

//p[@spec='len']  必须要加引号；等价于 css_selector里的("p[spec='len']")

//p[@id='kw']    xpath中对于id,class与其他元素一视同仁，没有其他的方法

 

# 选择第几个节点

//div/p[2]   选择div下的第二个p节点 ；等价于css_selector里的div>p:nth-of-type(2)  符合p类型的第二个节点

//div/*[2]    选择div下第二个元素

//div/p[position()=2]   position()=2   指定第二个位置；  等价于上面的 //div/p[2] 

          position()>=2      位置大于等于2

          position()<2        位置小于2

          position()！=2    位置不等于2

//div/p[last()]    选择div下的倒数第一个p节点； last()倒数第一个

//div/p[last()-1]    选择div下的倒数第二个p节点；

//div/p[position()=last()]     倒数第一个

//div/p[position()=last()-1]     倒数第二个

//div/p[position()>=last()-2]     倒数第一个，第二个，第三个

 

# 组合选择

//p | //button   选择所有的p和button，等价于css_selector里的 p, button

//input[@id='kw' and @class='su']     选择id=kw 并且 class=su的input元素

 

# 兄弟节点的选择

相邻后面的兄弟节点的选择：following-sibling::    两个冒号

//div/following-sibling::p    选择div里相邻的p节点

相邻前面的哥哥节点的选择：preceding-sibling::后面加上元素标签        # 此方法在css_selector中没有

相邻前面的弟弟节点的选择   following-sibling:: 后面加上元素标签 

//div/preceding-sibling::p[2]   选择div里前面相邻的第二个节点，不加[2]选择的是前面的所有的p节点

 

# 选择父节点    

//p[@spec='len']/..    选择p节点的上层节点       此方法在css_selector中没有

//p[@spec='len']/../..   上层节点的上层节点

 

# 在webelement对象里面使用查找Xpath 查找时，必须使用.指明当前节点

food = driver.find_element_by_id('food')

eles = food.find_elements_by_xpath(".//p")    .指明当前节点

eles = food.find_elements_by_xpath("..")   查找当前节点的父节点

# 引用
- 原文链接：https://blog.csdn.net/u012941152/article/details/83011110