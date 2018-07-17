---
    数据库设计
---
#### 版本

 V 1.0
 
####  文档信息

版本编号 | 状态 | 简要说明（变更内容，范围）| 日期 | 变更人
---|--- |--- | --- | ---
V 1.0 | 新建 | 新建 | 2018.7.17| 周子健


```
状态：新建，删除，修改，增加
```

### 数据库设计规范

#### 库命名规范

 采用26个英文字母(小写)和0-9的自然数(经常不需要)加上下划线'_'组成;命名简洁明确(长度不能超过30个字符);  
 
 例如：user, stat, log, 也可以wifi_user, wifi_stat, wifi_log给数据库加个前缀;  
 备份数据库可以加0-9的自然数：user_db_20180717;

#### 表命名规范
以t_开头，采用26个英文字母(小写)加上下划线组成，命名简洁明确，单词间用下划线分割。

垂直分表，须在原表基础加下划线后缀组成；
水平分表之id型，须按逻辑序列加下划线加起始id组成，且各个水平分表容量相同；  
水平分表之日期型，须按自然周期（年月日）分表

形如: 

t_user          用户基础表   
t_user_data     用户表垂直分表     
t_user_data_1000 用户水平分表id型  
t_user_data_201801 用户水平分表日期型

#### 字段命名规范
主要采用26个字母组成(小写)加上下划线组成，命名简单扼要，语义清晰。单词间用下划线分割。

例如：  
reward_name,表示奖品名称。每个表必须有自增主键。

字段名不得包含表名，例如：       
reward表中的奖品名称，应该表示为 t_reward.name 不能表示为 t_reward.reward_name


#### 字段类型规范
原则：  
效率优先  
参与数学运算（加减乘除）字段必须使用int等数字类型  
参与布尔运算字段可以使用char等字符类型  
不能使用double，money等浮点型类型，尽可能使用整型数据提高效率


#### 索引规范
命名简单扼要。
例如：     
简单字段索引：username，其索引名称为 username_idx  
复合字段索引：name age，其索引名称为 name_age_idx



#### 开发软件环境
java 1.8.0_171

mysql 8.0

RabbitMQ 3.7.5

springBoot 2.0.3.RELEASE

springData

maven 3.5.3





