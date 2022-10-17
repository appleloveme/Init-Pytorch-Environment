
ADD_COLOR(){
RED_COLOR='\E[1;31m'
GREEN_COLOR='\E[1;32m'
YELLOW_COLOR='\E[1;33m'
BLUE_COLOR='\E[1;34m'
PINK_COLOR='\E[1;35m'
RES='\E[0m'

#这里判断传入的参数是否不等于2个，如果不等于2个就提示并退出
if [ $# -ne 2 ];then
    echo "Usage $0 content {red|yellow|blue|green|pink}"
    exit
fi
case "$2" in
   red|RED)
        echo -e "${RED_COLOR}$1"
        ;;
   yellow|YELLOW)
        echo -e "${YELLOW_COLOR}$1"
        ;;
   green|GREEN)
        echo -e "${GREEN_COLOR}$1"
        ;;
   blue|BLUE)
        echo -e "${BLUE_COLOR}$1"
        ;;
   pink|PINK)
        echo -e "${PINK_COLOR}$1"
        ;;
         *)
        echo -e "请输入指定的颜色代码：{red|yellow|blue|green|pink}"
esac
}

ADD_COLOR ">>>>>>>>>>>>>>>>>>>>>>>Replace conda channels...<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<" red
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes

echo ''
echo ''
ADD_COLOR ">>>>>>>>>>>>>>>>>>>>>>>Replace pip channels...<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " red
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple


# 安装 Miniconda3，后续根据提示选择安装路径或添加到环境变量即可
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh

# 安装 Git
conda install git

# 显示当前 Shell 类型
ps -ef | grep `echo $$` | grep -v grep | grep -v ps

# 获取 ranger 配置
cd ~/.config
git clone https://github.com/appleloveme/ranger

# 初始化 Bash
cat bash_config.txt >> ~/.bashrc

