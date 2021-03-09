0310：
将30dayMakeOS的kernel拷贝到a.img中，运行出错；
将boot.bin拷贝到30dayMakeOS的img中，运行正常；
两个copy的差异是地址不同，30dayMakeOS对应磁盘地址4200，内存地址c200;我的磁盘地址是c400,内存是c400；
上面验证说明asmhead.nas中的地址拷贝与这个有关系，需要分析内存分布图；