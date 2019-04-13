new Vue({
  el: '#app',
  data: {
    result: ''
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
			id = this.getId();
			
			
			if(id != null && id.indexOf("android") == 0)
			{
				requestpath = "../android/android.js"
			}else if(id != null && id.indexOf("flutter") == 0)
			{
				requestpath = "../flutter/flutter.js"
			}else if(id != null && id.indexOf("game") == 0)
			{
				requestpath = "../game/game.js"
			}else if(id != null && id.indexOf("ios") == 0)
			{
				requestpath = "../ios/ios.js"
			}else if(id != null && id.indexOf("reactnative") == 0)
			{
				requestpath = "../reactnative/reactnative.js"
			}else if(id != null && id.indexOf("tool") == 0)
			{
				requestpath = "../tool/tool.js"
			}else if(id != null && id.indexOf("vue") == 0)
			{
				requestpath = "../vue/vue.js"
			}else if(id != null && id.indexOf("website") == 0)
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
			if(id != null && id.indexOf("android") == 0)
			{
				var array = result.dataAndroidFull1.concat(result.dataAndroidAnimation1)
                .concat(result.dataAndroidView1).concat(result.dataAndroidSynthesize1)
                .concat(result.dataAndroidArchitecture1).concat(result.dataAndroidComponent1)
				
				for(var i = 0; i < array.length;i++)
				{
					console.log(array[i].thumbUrl);
					this.result = array[i].description;
				}
			}else if(id != null && id.indexOf("flutter") == 0)
			{
				
			}else if(id != null && id.indexOf("game") == 0)
			{
				
			}else if(id != null && id.indexOf("ios") == 0)
			{
				
			}else if(id != null && id.indexOf("reactnative") == 0)
			{
				
			}else if(id != null && id.indexOf("tool") == 0)
			{
				
			}else if(id != null && id.indexOf("vue") == 0)
			{
				
			}else if(id != null && id.indexOf("website") == 0)
			{
				
			}
        }
  },
  mounted () {
	this.request()
  }
})