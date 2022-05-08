var data=[
    {
        "id": 1,
        "title": "Machine_learning",
        "price": 123,
        "time": "2017-03-15",
        "hot": 198,
        "img": "img/Machine_learning.jpg"
    },
    {
        "id": 2,
        "title": "Statistics",
        "price": 321,
        "time": "2017-02-08",
        "hot": 25,
        "img": "img/Statistics.jpg"
    },
    {
        "id": 3,
        "title": "Operating_system",
        "price": 456,
        "time": "2017-01-25",
        "hot": 568,
        "img": "img/Operating_system.jpg"
    },
    {
        "id": 4,
        "title": "Pointers_on_C",
        "price": 654,
        "time": "2016-12-30",
        "hot": 20000,
        "img": "img/Pointers_on_C.jpg"
    },
    {
        "id": 5,
        "title": "Arduino",
        "price": 789,
        "time": "2016-01-30",
        "hot": 1032654,
        "img": "img/Arduino.jpg"
    },
    {
        "id": 6,
        "title": "Polaris",
        "price": 987,
        "time": "2018-01-01",
        "hot": 1,
        "img": "img/Polaris.jpg"
    },
    {
        "id": 7,
        "title": "Java_web",
        "price": 12,
        "time": "2017-02-19",
        "hot": 400,
        "img": "img/Java_web.jpg"
    },
    {
        "id": 8,
        "title": "Database",
        "price": 21,
        "time": "2017-01-25",
        "hot": 240,
        "img": "img/Database.jpg"
    },
    {
        "id": 9,
        "title": "TOFEL",
        "price": 1234,
        "time": "2014-01-01",
        "hot": 12345,
        "img": "img/TOFEL.jpg"
    },
    {
        "id": 10,
        "title": "Innovator",
        "price": 4321,
        "time": "2017-01-25",
        "hot": 240,
        "img": "img/Innovator.jpg"
    }
]

    var lists=document.getElementById("lists");
    var links=document.querySelectorAll("#main .sortBtn");
    console.log(links);
    var lis;

    var str = "";
/*    for (var i = 0; i < data.length; i++) {
        console.log("输出"+data);
        var item = data[i];
 
        str+=`<li class="lic" data-time="${item.time}" data-price="${item.price}" data-hot="${item.hot}">
                  <img src="${item.img}" alt="">
                  <p>${item.title}</p>
                  <p>上架时间: ${item.time}</p>
                  <p>价格: ${item.price}</p>
                  <p>热度: ${item.hot}</p>
</li>`
    }
    goodsList.innerHTML = str;
    //这句写得什么...
    lis=[].slice.call(document.querySelectorAll("#main .lic"));
    */

        data.forEach((item,index) => {
            str+=`<li time="${item.time}" hot="${item.hot}" price="${item.price}">
                <img src="${item.img}" alt="">
                <p class="title">${item.title}</p>
                <span>Date:</span><p>${item.time}</p>
                <p class="numInfo">
                <p>Hot Point ${item.hot}</p>
                <form action="goodsin.jsp" method="post">
                    <span>ID:</span><input type="text" name="goods" value="${item.title}" size="2" readonly>
                    <span>Price:</span><input type="text" name="goodspri" value="${item.price}" size="2" readonly>
                    <input type="submit" class="a" value="Check More">
                    </form>
                </p>
            </li>`;
        });
        lists.innerHTML=str;
        lis=[].slice.call(document.querySelectorAll("#main li"));




for(var i=0;i<links.length;i++){
    links[i].flag=-1;
    //给每一个a标签绑定点击事件
    links[i].onclick=function(){
        console.log("lis1"+this.getAttribute("lis[1]"));
        console.log("lis2"+this.getAttribute("lis[2]"));
        for(var i=0;i<links.length;i++){
            if(links[i]!=this){
                links[i].flag=-1;
            }
        }
        console.log(links);
        //文档碎片
        var frg=document.createDocumentFragment();

        var that=this;
        this.flag*=-1;
        var arrowsAry=this.querySelectorAll("b");
        //为了保证只选择一个箭头，在添加之前，都先清除掉
        var curs=document.querySelectorAll("#topBar .current");
        for(var i=0;i<curs.length;i++){
            curs[i].classList.remove("current");
        }
        //值1 升序
        if(this.flag==1){
            arrowsAry[0].classList.add("current");
        }else{
            //值-1 降序
            arrowsAry[1].classList.add("current");
        }
        var sortFlag=this.getAttribute("sortFlag");
        console.log(sortFlag);
        //对li进行排序
        //时间排序
        if(sortFlag=="time"){
            //注意回调函数内部this指向
            lis.sort(function(a,b){return (a.getAttribute(sortFlag).replace(/-/g,"")-b.getAttribute(sortFlag).replace(/-/g,""))*that.flag;});
        }else{
            //热度、价格排序
            lis.sort(function(a,b){return (a.getAttribute(sortFlag)-b.getAttribute(sortFlag))*that.flag;});
        }
        console.log(this.getAttribute("lis[5]"));
        for(var i=0;i<lis.length;i++){
            frg.appendChild(lis[i]);
        }
        lists.appendChild(frg);
    }
} 