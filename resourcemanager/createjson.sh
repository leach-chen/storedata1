#!/usr/bin/env sh

host="https://www.leachchen.com/"

#仓库名称，和git上统一，新增仓库需修改
repo_android1="storeandroid1"
repo_flutter1="storeflutter1"
repo_h5game1="storeh5game1"
repo_ios1="storeios1"
repo_tool1="storetool1"
repo_vue1="storevue1"
repo_website1="storewebsite1"
repo_reactnative1="reactnative1"

#仓库url
repo_url_android1=$host$repo_android1
repo_url_flutter1=$host$repo_flutter1
repo_url_h5game1=$host$repo_h5game1
repo_url_ios1=$host$repo_ios1
repo_url_tool1=$host$repo_tool1
repo_url_vue1=$host$repo_vue1
repo_url_website1=$host$repo_website1
repo_url_reactnative1=$host$repo_reactnative1

#资源前缀，区分资源类型，和资源名称前缀统一
android1="android1"
flutter1="flutter1"
h5game1="h5game1"
ios1="ios1"
tool1="tool1"
vue1="vue1"
website1="website1"
reactnative1="reactnative"




#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
#资源type类型，和homeweb里面定义的类型统一,新增类型需修改
t_android_full_1="android_full_1"
t_android_animation_1="android_animation_1"
t_android_view_1="android_view_1"
t_android_synthesize_1="android_synthesize_1"
t_android_component_1="android_component_1"
t_android_architecture_1="android_architecture_1"

t_ios_full_1="ios_full_1"
t_ios_synthesize_1="ios_synthesize_1"

t_flutter_full_1="flutter_full_1"

t_vue_full_1="vue_full_1"

t_reactnative_full_1="reactnative_full_1"
t_reactnative_synthesize_1="reactnative_synthesize_1"

t_website_css_1="website_css_1"
t_website_jekyll_1="website_jekyll_1"
t_website_hexo_1="website_hexo_1"
t_website_php_1="website_php_1"

t_game_synthesize_1="game_synthesize_1"
t_game_shoot_1="game_shoot_1"
t_game_risk_1="game_risk_1"
t_game_smart_1="game_smart_1"
t_game_chesscard_1="game_chesscard_1"

t_tool_synthesize_1="tool_synthesize_1"

#data js 文件路径,新增类型需修改
jsurl_android="android/android.js"
jsurl_ios="ios/ios.js"
jsurl_flutter="flutter/flutter.js"
jsurl_website="website/website.js"
jsurl_game="game/game.js"
jsurl_vue="vue/vue.js"
jsurl_tool="tool/tool.js"
jsurl_reactnative="reactnative/reactnative.js"



#字段
id=""
thumbUrl=""
previewUrl=""
downloadUrl=""
description=""
type=""
author=""
authorurl=""
gitauthor=""
gitrepo=""
byauthor=""
byauthorurl=""
tag=""
time=""

tag_android="android"
tag_ios="ios"
tag_flutter="flutter"
tag_game="game"
tag_vue="vue"
tag_tool="tool"
tag_website="website"
tag_reactnative="reactnative"

hosturl=""

for file in `ls .`
do
	array=(${file//_/ })  #将文件名以下划线分割成字符串数组
	count=0
	for var in ${array[@]}	#遍历字符串数组
	do
		count=$(($count+1))
		if [ $count -eq 1 ];
		  then
			if [ ${array[0]} = $android1 ];
				then
					hosturl=$repo_url_android1
					id="android_"${array[1]}
					tag=$tag_android
			fi

			if [ ${array[0]} = $flutter1 ];
				then
					hosturl=$repo_url_flutter1
					id="flutter_"${array[1]}
					tag=$tag_flutter
			fi

			if [ ${array[0]} = $reactnative1 ];
				then
					hosturl=$repo_url_reactnative1
					id="reactnative_"${array[1]}
					tag=$tag_reactnative
			fi

			if [ ${array[0]} = $h5game1 ];
				then
					hosturl=$repo_url_h5game1
					id="game_"${array[1]}
					tag=$tag_game
			fi

			if [ ${array[0]} = $ios1 ];
				then
					hosturl=$repo_url_ios1
					id="ios_"${array[1]}
					tag=$tag_ios
			fi

			if [ ${array[0]} = $tool1 ];
				then
					hosturl=$repo_url_tool1
					id="tool_"${array[1]}
					tag=$tag_tool
			fi

			if [ ${array[0]} = $vue1 ];
				then
					hosturl=$repo_url_vue1
					id="vue_"${array[1]}
					tag=$tag_vue
			fi

			if [ ${array[0]} = $website1 ];
				then
					hosturl=$repo_url_website1
					id="website_"${array[1]}
					tag=$tag_website
			fi
		elif [ $count -eq 2 ];	#如果是第二个数据
		  then
			temp="temp"
		elif [ $count -eq 3 ];	#如果是第二个数据
		  then
			if [ ${var:0:1} = "t" ];
				then
					thumbUrl=$hosturl"/"${array[1]}"/"$file
			elif [ ${var:0:1} = "p" ];
				then
					previewUrl=$hosturl"/"${array[1]}"/"$file
			elif [ ${var:0:1} = "d" ];
				then
					downloadUrl=$hosturl"/"${array[1]}"/"$file
			fi
		fi
	done
done


if [ -z "$thumbUrl" ];
	then
		echo "请输入缩略图url(thumbUrl):"
		read thumb
		thumbUrl=$thumb
fi

if [ -z "$previewUrl" ];
	then
		echo "请输入预览url(previewUrl):"
		read pre
		previewUrl=$pre
fi


echo "----------------------------------"
echo "请输入资源描述(description):"
echo "----------------------------------"
read dec
description=$dec

#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
#新增类型需修改
echo "----------------------------------"
echo "请选择资源分类:"
echo "(101) $t_android_full_1"
echo "(102) $t_android_animation_1"
echo "(103) $t_android_view_1"
echo "(104) $t_android_synthesize_1"
echo "(105) $t_android_component_1"
echo "(106) $t_android_architecture_1"
echo "(201) $t_ios_full_1"
echo "(202) $t_ios_synthesize_1"
echo "(301) $t_flutter_full_1"
echo "(401) $t_vue_full_1"
echo "(501) $t_website_css_1"
echo "(502) $t_website_jekyll_1"
echo "(503) $t_website_hexo_1"
echo "(504) $t_website_php_1"
echo "(601) $t_game_synthesize_1"
echo "(602) $t_game_smart_1"
echo "(603) $t_game_chesscard_1"
echo "(604) $t_game_shoot_1"
echo "(605) $t_game_risk_1"
echo "(701) $t_tool_synthesize_1"
echo "(801) $t_reactnative_full_1"
echo "(802) $t_reactnative_synthesize_1"
echo "----------------------------------"
read input

case $input in
    101)
		type=$t_android_full_1
		;;
	102)
		type=$t_android_animation_1
		;;
	103)
		type=$t_android_view_1
		;;
	104)
		type=$t_android_synthesize_1
		;;
	105)
		type=$t_android_component_1
		;;
	106)
		type=$t_android_architecture_1
		;;
	201)
		type=$t_ios_full_1
		;;
	202)
			type=$t_ios_synthesize_1
			;;
	301)
		type=$t_flutter_full_1
		;;
	401)
		type=$t_vue_full_1
		;;
	501)
		type=$t_website_css_1
		;;
	502)
		type=$t_website_jekyll_1
		;;
	503)
		type=$t_website_hexo_1
		;;
	504)
		type=$t_website_php_1
		;;
	601)
		type=$t_game_synthesize_1
		;;
	602)
		type=$t_game_smart_1
		;;
	603)
		type=$t_game_chesscard_1
		;;
	604)
		type=$t_game_shoot_1
		;;
	605)
		type=$t_game_risk_1
		;;
	701)
		type=$t_tool_synthesize_1
		;;
	801)
		type=$t_reactnative_full_1
		;;
	802)
		type=$t_reactnative_synthesize_1
			;;
esac


echo "----------------------------------"
echo "请输入作者昵称(author):"
echo "----------------------------------"
read aut
author=$aut

echo "----------------------------------"
echo "请输入作者url(authorurl):"
echo "----------------------------------"
read auturl
authorurl=$auturl

echo "----------------------------------"
echo "请输入Git作者名称(gitauthor):"
echo "----------------------------------"
read gitaut
gitauthor=$gitaut

echo "----------------------------------"
echo "请输入Git仓库名称(gitrepo):"
echo "----------------------------------"
read gitrep
gitrepo=$gitrep

echo "----------------------------------"
echo "请输入来自作者昵称(byauthor):"
echo "----------------------------------"
read byaut
byauthor=$byaut


echo "----------------------------------"
echo "请输入来自作者url(byauthorurl):"
echo "----------------------------------"
read byauturl
byauthorurl=$byauturl


if [ -z "$downloadUrl" ];
	then
	if [ -z "$gitrepo" ];
		then
			echo "请输入下载downloadUrl(downloadUrl):"
			read down
			downloadUrl=$down
	else
			downloadUrl="https://codeload.github.com/$gitauthor/$gitrepo/zip/master"
	fi
fi

if [ -z "$thumbUrl" ];
	then
		echo "请输入缩略图url(thumbUrl):"
		read thumb
		thumbUrl=$thumb
fi


if [ -z "$authorurl" ];
	then
	authorurl="https://github.com/"$gitauthor
	if [ -z "$gitauthor" ];
		then
			echo "请输入作者url(authorurl):"
			read auturl
			authorurl=$auturl
	fi
fi


echo "请输入tag:"
read ttag
if [ ! -z "$ttag" ];
	then
		tag=$ttag
fi



thumbUrl=${thumbUrl//\//\\/}
previewUrl=${previewUrl//\//\\/}
downloadUrl=${downloadUrl//\//\\/}
description=${description//\//\\/}
type=${type//\//\\/}
author=${author//\//\\/}
authorurl=${authorurl//\//\\/}
gitauthor=${gitauthor//\//\\/}
gitrepo=${gitrepo//\//\\/}
byauthor=${byauthor//\//\\/}
byauthorurl=${byauthorurl//\//\\/}
tag=${tag//\//\\/}
time=${time//\//\\/}




#https://www.cnblogs.com/kings-9/p/7738724.html


#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
cd ..

jsurl=""
replacestr=""

if [ $type = $t_android_full_1 ];
	then
		jsurl=$jsurl_android
		replacestr="\"dataAndroidFull1\":\["
fi

if [ $type = $t_android_animation_1 ];
	then
		jsurl=$jsurl_android
		replacestr="\"dataAndroidAnimation1\"\:\["
fi

if [ $type = $t_android_view_1 ];
	then
		jsurl=$jsurl_android
		replacestr="\"dataAndroidView1\"\:\["
fi

if [ $type = $t_android_synthesize_1 ];
	then
		jsurl=$jsurl_android
		replacestr="\"dataAndroidSynthesize1\"\:\["
fi

if [ $type = $t_android_component_1 ];
	then
		jsurl=$jsurl_android
		replacestr="\"dataAndroidComponent1\"\:\["
fi


if [ $type = $t_android_architecture_1 ];
	then
		jsurl=$jsurl_android
		replacestr="\"dataAndroidArchitecture1\"\:\["
fi




if [ $type = $t_ios_full_1 ];
	then
		jsurl=$jsurl_ios
		replacestr="\"dataIosFull1\"\:\["
fi

if [ $type = $t_ios_synthesize_1 ];
	then
		jsurl=$jsurl_ios
		replacestr="\"dataIosSynthesize1\"\:\["
fi



if [ $type = $t_flutter_full_1 ];
	then
		jsurl=$jsurl_flutter
		replacestr="\"dataFlutterFull1\"\:\["
fi



if [ $type = $t_vue_full_1 ];
	then
		jsurl=$jsurl_vue
		replacestr="\"dataVueFull1\"\:\["
fi



if [ $type = $t_website_css_1 ];
	then
		jsurl=$jsurl_website
		replacestr="\"dataWebsiteCss1\"\:\["
fi

if [ $type = $t_website_jekyll_1 ];
	then
		jsurl=$jsurl_website
		replacestr="\"dataWebsiteJekyll1\"\:\["
fi

if [ $type = $t_website_hexo_1 ];
	then
		jsurl=$jsurl_website
		replacestr="\"dataWebsiteHexo1\"\:\["
fi

if [ $type = $t_website_php_1 ];
	then
		jsurl=$jsurl_website
		replacestr="\"dataWebsitePhp1\"\:\["
fi



if [ $type = $t_game_synthesize_1 ];
	then
		jsurl=$jsurl_game
		replacestr="\"dataGameSynthesize1\"\:\["
fi

if [ $type = $t_game_smart_1 ];
	then
		jsurl=$jsurl_game
		replacestr="\"dataGameSmart1\"\:\["
fi

if [ $type = $t_game_shoot_1 ];
	then
		jsurl=$jsurl_game
		replacestr="\"dataGameShoot1\"\:\["
fi

if [ $type = $t_game_chesscard_1 ];
	then
		jsurl=$jsurl_game
		replacestr="\"dataGameChesscard1\"\:\["
fi

if [ $type = $t_game_risk_1 ];
	then
		jsurl=$jsurl_game
		replacestr="\"dataGameRisk1\"\:\["
fi



if [ $type = $t_tool_synthesize_1 ];
	then
		jsurl=$jsurl_tool
		replacestr="\"dataToolSynthesize1\"\:\["
fi

if [ $type = $t_reactnative_full_1 ];
	then
		jsurl=$jsurl_reactnative
		replacestr="\"dataReactnativeFull1\"\:\["
fi


if [ $type = $t_reactnative_synthesize_1 ];
	then
		jsurl=$jsurl_reactnative
		replacestr="\"dataReactnativeSynthesize1\"\:\["
fi

time=`date +%Y%m%d%H%M%S`


json="$replacestr{\n    \"id\":\"$id\",\n    \"thumbUrl\":\"$thumbUrl\",\n    \"previewUrl\":\"$previewUrl\",\n    \"downloadUrl\":\"$downloadUrl\",\n    \"description\":\"$description\",\n    \"type\":\"$type\",\n    \"author\":\"$author\",\n    \"authorurl\":\"$authorurl\",\n    \"gitauthor\":\"$gitauthor\",\n    \"gitrepo\":\"$gitrepo\",\n    \"byauthor\":\"$byauthor\",\n    \"byauthorurl\":\"$byauthorurl\",\n    \"sold\":true,\n    \"tag\":\"$tag\",\n  \"time\":\"$time\"\n  },"

#json除了前缀其它和上面一致
searchjson="{\n    \"id\":\"$id\",\n    \"thumbUrl\":\"$thumbUrl\",\n    \"previewUrl\":\"$previewUrl\",\n    \"downloadUrl\":\"$downloadUrl\",\n    \"description\":\"$description\",\n    \"type\":\"$type\",\n    \"author\":\"$author\",\n    \"authorurl\":\"$authorurl\",\n    \"gitauthor\":\"$gitauthor\",\n    \"gitrepo\":\"$gitrepo\",\n    \"byauthor\":\"$byauthor\",\n    \"byauthorurl\":\"$byauthorurl\",\n    \"sold\":true,\n    \"tag\":\"$tag\",\n  \"time\":\"$time\"\n  },"

echo $json

echo $jsurl

echo $searchjson



echo "----------------------------------"
echo "是否插入数据:"
echo "(101) 插入数据"
echo "(102) 终止插入数据"
echo "----------------------------------"
read input

case $input in
    101)

		sed -i "s/${replacestr}/${json}/g" $jsurl

		cd other/algolia
		sed -i "s/\/\/replace/\/\/replace${searchjson}/g" algolia.txt
		sed -i "s/\/\/replace/\/\/replace${searchjson}/g" allalgolia.txt
		;;
	102)

		;;
esac





read -p "Press any key to continue." var
