new Vue({
  el: '#app',
  data: {
	urlid:"",
	id:"android_1",
	time:"",
	thumbUrl: "",
	previewUrl: "",
	downloadUrl: "",
	title:"",
	description: "",
	type: "",
	author: "",
	authorurl: "",
	gitauthor: "",
	gitrepo: "",
	byauthor: "",
	byauthorurl: "",
	tag: "",
	isPreviewImage:	false,
  },
  methods:{
	  getId:function()
	  {
		var result;
		var url=window.location.search;
		if(url.indexOf("?")!=-1){
			result = url.substr(url.indexOf("=")+1);
		}
		return result;
	  },
	  request:function()
	  {
			var requestpath = ""
			var id = this.getId();
			this.urlid = id;
			
			
			if(id != null && id.indexOf("android") >= 0)
			{
				requestpath = "../android/android.js"
			}else if(id != null && id.indexOf("flutter") >= 0)
			{
				requestpath = "../flutter/flutter.js"
			}else if(id != null && id.indexOf("game") >= 0)
			{
				requestpath = "../game/game.js"
			}else if(id != null && id.indexOf("ios") >= 0)
			{
				requestpath = "../ios/ios.js"
			}else if(id != null && id.indexOf("reactnative") >= 0)
			{
				requestpath = "../reactnative/reactnative.js"
			}else if(id != null && id.indexOf("tool") >= 0)
			{
				requestpath = "../tool/tool.js"
			}else if(id != null && id.indexOf("vue") >= 0)
			{
				requestpath = "../vue/vue.js"
			}else if(id != null && id.indexOf("website") >= 0)
			{
				requestpath = "../website/website.js"
			}
			
			if(id != null)
			{
				 var that = this;
				 $.ajax({ 
							type: "Get",
							url: requestpath,
							dataType: "json",
							success: function(result){
								that.handData(result)
							}
						});
				
			}
		},
		handData:function(result){
			var id = this.urlid;
			var array = [];
			if(id != null && id.indexOf("android") == 0)
			{
				array = result.dataAndroidFull1.concat(result.dataAndroidAnimation1)
                .concat(result.dataAndroidView1).concat(result.dataAndroidSynthesize1)
                .concat(result.dataAndroidArchitecture1).concat(result.dataAndroidComponent1);
			}else if(id != null && id.indexOf("flutter") == 0)
			{
				 array = result.dataFlutterFull1
			}else if(id != null && id.indexOf("game") == 0)
			{
				array = result.dataGameSynthesize1.concat(result.dataGameSmart1)
                .concat(result.dataGameChesscard1).concat(result.dataGameRisk1)
                .concat(result.dataGameShoot1)
			}else if(id != null && id.indexOf("ios") == 0)
			{
				array = result.dataIosFull1.concat(result.dataIosSynthesize1);
			}else if(id != null && id.indexOf("reactnative") == 0)
			{
				array = result.dataReactnativeFull1.concat(result.dataReactnativeSynthesize1)
			}else if(id != null && id.indexOf("tool") == 0)
			{
				array = result.dataToolSynthesize1.concat(result.dataToolImgoperate1)
			}else if(id != null && id.indexOf("vue") == 0)
			{
				array = result.dataVueFull1.concat(result.dataVueSynthesize1)
			}else if(id != null && id.indexOf("website") == 0)
			{
				array = result.dataWebsiteCoolH51.concat(result.dataWebsiteAnimationLib1).concat(result.dataWebsiteCss1)
			}
			
		
			for(var i = 0; i < array.length;i++)
			{
				console.log(array[i].thumbUrl);
				if(array[i].id == id)
				{
					this.id = array[i].id
					this.time = array[i].time
					this.thumbUrl = array[i].thumbUrl
					this.previewUrl = array[i].previewUrl
					this.downloadUrl = array[i].downloadUrl
					this.title = array[i].title
					this.description = array[i].description
					this.type = array[i].type
					this.author = array[i].author
					this.authorurl = array[i].authorurl
					this.gitauthor = array[i].gitauthor
					this.gitrepo = array[i].gitrepo
					this.byauthor = array[i].byauthor
					this.byauthorurl = array[i].byauthorurl
					this.tag = array[i].tag
					
					if((this.previewUrl.toLowerCase().indexOf("jpg") >= 0) || (this.previewUrl.toLowerCase().indexOf("png") >= 0) || (this.previewUrl.toLowerCase().indexOf("gif")  >= 0))
					{
						this.isPreviewImage = true;
					}else{
						this.isPreviewImage = false;
					}
				}
			}
        },
		judgeAdsense:function()
		{
		   var ua = navigator.userAgent;

			var ipad = ua.match(/(iPad).*OS\s([\d_]+)/),

			isIphone =!ipad && ua.match(/(iPhone\sOS)\s([\d_]+)/),

			isAndroid = ua.match(/(Android)\s+([\d.]+)/),

			isMobile = isIphone || isAndroid;

			//判断

			if(isMobile){
				var pc = document.getElementById("pcuse")
				if (pc != null)
				{
					pc.parentNode.removeChild(pc);
				}
			}else{
				var phone = document.getElementById("phoneuse")
				if (phone != null)
				{
					phone.parentNode.removeChild(phone);
				}
			}
		},
		onPreview:function(url)
        {
            //alert(url)
            window.open("https://www.leachchen.com/webopen/open.html?open="+url+"/");
            //window.location.href = url;
            //window.open(url);
        },
        onDownload(url)
        {
            //alert(url)
            //window.location.href = url;
            if(this.isTool == true)
            {
                window.open("https://www.leachchen.com/webopen/open.html?open="+url+"/");
            }else{
                window.open("https://www.leachchen.com/webopen/download.html?open="+url);
            }
        },
  },
  mounted () {
	this.request()
	this.judgeAdsense()
  }
})