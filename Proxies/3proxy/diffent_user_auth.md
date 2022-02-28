# 3PROXY 不同用户认证配置

## 安装3proxy
```bash
#下载3proxy
yum -y install wget
wget "https://github.com/z3APA3A/3proxy/releases/download/0.9.3/3proxy-0.9.3.x86_64.rpm"
yum -y install 3proxy-0.9.3.x86_64.rpm
rm -rf 3proxy-0.9.3.x86_64.rpm
```

## 配置用户账号密码
```bash
$/usr/local/3proxy/conf/add3proxyuser.sh
#执行命令来创建账户
usage: /usr/local/3proxy/conf/add3proxyuser.sh username password [day_limit] [bandwidth]
	day_limit - traffic limit in MB per day
	bandwidth - bandwith in bits per second 1048576 = 1Mbp
#脚本文件内容
#!/bin/sh
if [ $4 ]; then  
	echo bandlimin $4 $1 >> /etc/3proxy/conf/bandlimiters
fi
if [ $3 ]; then  
	echo countin \"`wc -l /etc/3proxy/conf/counters|awk '{print $1}'`/$1\" D $3 $1 >> /etc/3proxy/conf/counters
fi
if [ $2 ]; then  
	echo $1:`/bin/mycrypt $$ $2` >> /etc/3proxy/conf/passwd
else
	echo usage: $0 username password [day_limit] [bandwidth]
	echo "	"day_limit - traffic limit in MB per day
	echo "	"bandwidth - bandwith in bits per second 1048576 = 1Mbps
fi

```

## 加载配置
### 主配置文件
```bash
$/etc/3proxy.cfg
#!/bin/3proxy
#daemon
pidfile /var/run/3proxy.pid
chroot /usr/local/3proxy proxy proxy
include /conf/3proxy.cfg
```

### 次级配置文件
```bash
nscache 65536
nserver 8.8.8.8
nserver 8.8.4.4

config /conf/3proxy.cfg
monitor /conf/3proxy.cfg

log /logs/3proxy-%y%m%d.log D
rotate 60
#counter /count/3proxy.3cf

users $/conf/passwd

#include /conf/counters
#include /conf/bandlimiters
auth strong
allow WB945Z
proxy -p54080 -i94.137.76.2 -e94.137.76.2
flush
auth strong
allow LB376Q
proxy -p37913 -i94.137.76.3 -e94.137.76.3
flush
auth strong
allow OJ427R
proxy -p24379 -i94.137.76.4 -e94.137.76.4
flush
auth strong
allow AZ165N
proxy -p59639 -i94.137.76.5 -e94.137.76.5
flush
auth strong
allow BK700E
proxy -p52859 -i94.137.76.6 -e94.137.76.6
flush
auth strong
allow VU737Y
proxy -p32801 -i94.137.76.7 -e94.137.76.7
flush
auth strong
allow RT613L
proxy -p28271 -i94.137.76.8 -e94.137.76.8
flush
auth strong
allow CT663I
proxy -p61214 -i94.137.76.9 -e94.137.76.9
flush
auth strong
allow VB854B
proxy -p57139 -i94.137.76.10 -e94.137.76.10
flush
auth strong
allow TY796R
proxy -p40213 -i94.137.76.11 -e94.137.76.11
flush
auth strong
allow VU631Z
proxy -p24826 -i94.137.76.12 -e94.137.76.12
flush
auth strong
allow YR965H
proxy -p47535 -i94.137.76.13 -e94.137.76.13
flush
auth strong
allow WL103Y
proxy -p25445 -i94.137.76.14 -e94.137.76.14
flush
auth strong
allow DJ627E
proxy -p21948 -i94.137.76.15 -e94.137.76.15
flush
auth strong
allow UE770X
proxy -p46885 -i94.137.76.16 -e94.137.76.16
flush
auth strong
allow FC852Q
proxy -p52519 -i94.137.76.17 -e94.137.76.17
flush
auth strong
allow IF245F
proxy -p60658 -i94.137.76.18 -e94.137.76.18
flush
auth strong
allow UF206C
proxy -p53127 -i94.137.76.19 -e94.137.76.19
flush
auth strong
allow TP476J
proxy -p32912 -i94.137.76.20 -e94.137.76.20
flush
auth strong
allow XP271J
proxy -p59194 -i94.137.76.21 -e94.137.76.21
flush
auth strong
allow RG368B
proxy -p35170 -i94.137.76.22 -e94.137.76.22
flush
auth strong
allow EG264B
proxy -p33803 -i94.137.76.23 -e94.137.76.23
flush
auth strong
allow MO657N
proxy -p48929 -i94.137.76.24 -e94.137.76.24
flush
auth strong
allow BR279D
proxy -p53220 -i94.137.76.25 -e94.137.76.25
flush
auth strong
allow YB619J
proxy -p54495 -i94.137.76.26 -e94.137.76.26
flush
auth strong
allow AZ846A
proxy -p51620 -i94.137.76.27 -e94.137.76.27
flush
auth strong
allow HN915L
proxy -p31889 -i94.137.76.28 -e94.137.76.28
flush
auth strong
allow PX518Y
proxy -p30963 -i94.137.76.29 -e94.137.76.29
flush
auth strong
allow JK380F
proxy -p38606 -i94.137.76.30 -e94.137.76.30
flush
auth strong
allow BT252I
proxy -p18661 -i94.137.76.31 -e94.137.76.31
flush
auth strong
allow SE455M
proxy -p10668 -i94.137.76.32 -e94.137.76.32
flush
auth strong
allow GQ107C
proxy -p13468 -i94.137.76.33 -e94.137.76.33
flush
auth strong
allow KY100V
proxy -p53637 -i94.137.76.34 -e94.137.76.34
flush
auth strong
allow SU619G
proxy -p52923 -i94.137.76.35 -e94.137.76.35
flush
auth strong
allow OH842H
proxy -p35386 -i94.137.76.36 -e94.137.76.36
flush
auth strong
allow SZ333C
proxy -p35104 -i94.137.76.37 -e94.137.76.37
flush
auth strong
allow ZI629F
proxy -p16464 -i94.137.76.38 -e94.137.76.38
flush
auth strong
allow LC670A
proxy -p22741 -i94.137.76.39 -e94.137.76.39
flush
auth strong
allow FD753U
proxy -p33241 -i94.137.76.40 -e94.137.76.40
flush
auth strong
allow IP267P
proxy -p29825 -i94.137.76.41 -e94.137.76.41
flush
auth strong
allow JO893Q
proxy -p16631 -i94.137.76.42 -e94.137.76.42
flush
auth strong
allow RK556P
proxy -p23467 -i94.137.76.43 -e94.137.76.43
flush
auth strong
allow OT283W
proxy -p58655 -i94.137.76.44 -e94.137.76.44
flush
auth strong
allow NP119D
proxy -p11892 -i94.137.76.45 -e94.137.76.45
flush
auth strong
allow RX697N
proxy -p28213 -i94.137.76.46 -e94.137.76.46
flush
auth strong
allow KD929U
proxy -p32224 -i94.137.76.47 -e94.137.76.47
flush
auth strong
allow EL262Y
proxy -p58344 -i94.137.76.48 -e94.137.76.48
flush
auth strong
allow MB628H
proxy -p23228 -i94.137.76.49 -e94.137.76.49
flush
auth strong
allow OE504O
proxy -p41166 -i94.137.76.50 -e94.137.76.50
flush
auth strong
allow KD520Z
proxy -p54938 -i94.137.76.51 -e94.137.76.51
flush
auth strong
allow KE250E
proxy -p31955 -i94.137.76.52 -e94.137.76.52
flush
auth strong
allow DQ496O
proxy -p13659 -i94.137.76.53 -e94.137.76.53
flush
auth strong
allow HM263V
proxy -p11002 -i94.137.76.54 -e94.137.76.54
flush
auth strong
allow KF263D
proxy -p15586 -i94.137.76.55 -e94.137.76.55
flush
auth strong
allow NV816Z
proxy -p26755 -i94.137.76.56 -e94.137.76.56
flush
auth strong
allow LR645D
proxy -p21521 -i94.137.76.57 -e94.137.76.57
flush
auth strong
allow NT448X
proxy -p22667 -i94.137.76.58 -e94.137.76.58
flush
auth strong
allow LJ228N
proxy -p35784 -i94.137.76.59 -e94.137.76.59
flush
auth strong
allow FT901N
proxy -p64375 -i94.137.76.60 -e94.137.76.60
flush
auth strong
allow IT670C
proxy -p36923 -i94.137.76.61 -e94.137.76.61
flush
auth strong
allow CE265S
proxy -p35956 -i94.137.76.62 -e94.137.76.62
flush
auth strong
allow IL439V
proxy -p44926 -i94.137.76.63 -e94.137.76.63
flush
auth strong
allow WB453E
proxy -p18248 -i94.137.76.64 -e94.137.76.64
flush
auth strong
allow CZ118S
proxy -p40378 -i94.137.76.65 -e94.137.76.65
flush
auth strong
allow MU532M
proxy -p30922 -i94.137.76.66 -e94.137.76.66
flush
auth strong
allow PV912V
proxy -p38745 -i94.137.76.67 -e94.137.76.67
flush
auth strong
allow UN830W
proxy -p29828 -i94.137.76.68 -e94.137.76.68
flush
auth strong
allow TA944M
proxy -p11077 -i94.137.76.69 -e94.137.76.69
flush
auth strong
allow IK127Z
proxy -p25471 -i94.137.76.70 -e94.137.76.70
flush
auth strong
allow PR988V
proxy -p59644 -i94.137.76.71 -e94.137.76.71
flush
auth strong
allow ZW109B
proxy -p11516 -i94.137.76.72 -e94.137.76.72
flush
auth strong
allow JT633O
proxy -p30877 -i94.137.76.73 -e94.137.76.73
flush
auth strong
allow GS473Y
proxy -p22137 -i94.137.76.74 -e94.137.76.74
flush
auth strong
allow NK157Q
proxy -p59057 -i94.137.76.75 -e94.137.76.75
flush
auth strong
allow TB385D
proxy -p25258 -i94.137.76.76 -e94.137.76.76
flush
auth strong
allow IM971O
proxy -p39016 -i94.137.76.77 -e94.137.76.77
flush
auth strong
allow OY559F
proxy -p12721 -i94.137.76.78 -e94.137.76.78
flush
auth strong
allow LJ295K
proxy -p23264 -i94.137.76.79 -e94.137.76.79
flush
auth strong
allow EQ375Z
proxy -p49190 -i94.137.76.80 -e94.137.76.80
flush
auth strong
allow GN374A
proxy -p33904 -i94.137.76.81 -e94.137.76.81
flush
auth strong
allow UO369L
proxy -p57679 -i94.137.76.82 -e94.137.76.82
flush
auth strong
allow BM530Q
proxy -p30529 -i94.137.76.83 -e94.137.76.83
flush
auth strong
allow WV276I
proxy -p58633 -i94.137.76.84 -e94.137.76.84
flush
auth strong
allow BA179Y
proxy -p39319 -i94.137.76.85 -e94.137.76.85
flush
auth strong
allow LM582B
proxy -p27446 -i94.137.76.86 -e94.137.76.86
flush
auth strong
allow SK311R
proxy -p39654 -i94.137.76.87 -e94.137.76.87
flush
auth strong
allow GV294F
proxy -p24701 -i94.137.76.88 -e94.137.76.88
flush
auth strong
allow RL784M
proxy -p50929 -i94.137.76.89 -e94.137.76.89
flush
auth strong
allow XO511C
proxy -p35534 -i94.137.76.90 -e94.137.76.90
flush
auth strong
allow EJ724M
proxy -p41823 -i94.137.76.91 -e94.137.76.91
flush
auth strong
allow BS764R
proxy -p54897 -i94.137.76.92 -e94.137.76.92
flush
auth strong
allow FK629T
proxy -p10932 -i94.137.76.93 -e94.137.76.93
flush
auth strong
allow OE272B
proxy -p63769 -i94.137.76.94 -e94.137.76.94
flush
auth strong
allow TI529N
proxy -p46050 -i94.137.76.95 -e94.137.76.95
flush
auth strong
allow WB921O
proxy -p47725 -i94.137.76.96 -e94.137.76.96
flush
auth strong
allow XE588J
proxy -p14155 -i94.137.76.97 -e94.137.76.97
flush
auth strong
allow TU477M
proxy -p40006 -i94.137.76.98 -e94.137.76.98
flush
auth strong
allow DV807F
proxy -p44924 -i94.137.76.99 -e94.137.76.99
flush
auth strong
allow MM620W
proxy -p54696 -i94.137.76.100 -e94.137.76.100
flush
allow admin
admin -p18042
```

### 密码文件
```bash
WB945Z:CR:$1$3006$P0z41JSHmB6v9uBd9g/020
LB376Q:CR:$1$3008$3uDrXYJCX4KqOjVI3h6cb.
OJ427R:CR:$1$3010$/txllAEEnm4MWdknhCgwJ0
AZ165N:CR:$1$3012$okWCprA0zf1JyUCfkNdqF1
BK700E:CR:$1$3014$YGae7MK/hPw6SmlQcJ26J.
VU737Y:CR:$1$3016$tVTsafUKEQf3rz6lzL4OF.
RT613L:CR:$1$3018$8DTUCZrMi5Ufk7NSUcBs2/
CT663I:CR:$1$3020$H8oGtsJhSEv4JD80PSJBZ/
VB854B:CR:$1$3022$IrFwqbTrkaJkYhmPVis0g0
TY796R:CR:$1$3024$sCU1p0QLwv79Nspqk/7pT/
VU631Z:CR:$1$3026$1mAqDGbOn2YEEm3P4cS9m/
YR965H:CR:$1$3028$ZZqagUmb6tAVkLcPAaPNF1
WL103Y:CR:$1$3030$csN096Ks0C5N.1LfNprXc.
DJ627E:CR:$1$3032$2KG6XHAQ/KezG3iVn.SSv0
UE770X:CR:$1$3034$IffiALJlQysVflpQ0zG7L.
FC852Q:CR:$1$3036$M7d2v1tn8RQwM84f5IuFz.
IF245F:CR:$1$3038$m8YYlLxmCVzUv9CPYxSgi1
UF206C:CR:$1$3040$gRk4XXkZdKSQavWER9gPX0
TP476J:CR:$1$3042$EfKbxHED0ZwnksXOqygn9.
XP271J:CR:$1$3044$zZyi6CIL/IFTZOA1qDGGN1
RG368B:CR:$1$3046$UPMwSVdwV34l14XFpjAVY0
EG264B:CR:$1$3048$a8pGyGum7oQBog/w1yLiJ0
MO657N:CR:$1$3050$JGtYnho/c5t9rh5v6hhB4.
BR279D:CR:$1$3052$5bhLaC4LUblP8tsQh0LT60
YB619J:CR:$1$3054$yhnmRM.RGTlIf/hwNYxt40
AZ846A:CR:$1$3056$izZ6wmZY35r0Ggikq8fDe/
HN915L:CR:$1$3058$1LAtQ7ezutPB4s4VLhS43/
PX518Y:CR:$1$3060$EQWtgDI.dk9qrDqtSSeAk0
JK380F:CR:$1$3062$mMWo9q9P/DYKE0cN6BOx91
BT252I:CR:$1$3064$.1E7k2stfZhYFRMQAxxaY.
SE455M:CR:$1$3066$q.ajBwSU9TP846ktvMRf6/
GQ107C:CR:$1$3068$D8OSywnZXLzWgcdNh.dOQ0
KY100V:CR:$1$3070$D2ztDGVOgDcuIJSpWNZ.E.
SU619G:CR:$1$3072$m6KrLjA.RG5lKKMdUMQFK1
OH842H:CR:$1$3074$uOg.VNgxs/EG21nnWLoJn/
SZ333C:CR:$1$3076$3O2O4jtFRHojHviemnyjG/
ZI629F:CR:$1$3078$Ek5.yKaYSiZjpXKfwgJtx/
LC670A:CR:$1$3080$wV67ShaeyGZbc2ImSoub41
FD753U:CR:$1$3082$T6PfmdnA81J17uSlcIpBP.
IP267P:CR:$1$3084$9iEKVcavb8YHah6w4IRE4.
JO893Q:CR:$1$3086$pDxlC53k4I2d2wlO00soc/
RK556P:CR:$1$3088$ZPlziN/zjqWeLCeeRqPtP1
OT283W:CR:$1$3090$3bBf6T6r4MFux1u4AG30Y0
NP119D:CR:$1$3092$4xv1IcqXIc.R.nAmrRFnQ/
RX697N:CR:$1$3094$hRIJgZ5b1fabldd8flOKu1
KD929U:CR:$1$3096$ElG2f1/29dUhS7MMe8kDZ/
EL262Y:CR:$1$3098$.vYlUjW7mPc.WA2bl9RY/0
MB628H:CR:$1$3100$H8yAVdyzNlYxqb5bs3Pop/
OE504O:CR:$1$3102$fvNaDvys7F.e4BjzQ/qGL0
KD520Z:CR:$1$3104$VoY3ygTSX2Npn3RRhe5fi1
KE250E:CR:$1$3106$PvKuzDgOGbzL/D1kCCSlV1
DQ496O:CR:$1$3108$.mbu1N7G6LYONFeYRIpZe1
HM263V:CR:$1$3110$WgXYfeYZOp2426n0WB3db0
KF263D:CR:$1$3112$wVg4G/FqSHLt8F8l9cn5I0
NV816Z:CR:$1$3114$WC/FOJGj/aLbx6TDe6nY//
LR645D:CR:$1$3116$ToLZthCUdfYzEm5Mqo9H6.
NT448X:CR:$1$3118$guMwRKZjosd.mOQGly7lh/
LJ228N:CR:$1$3120$oGMF5a46OvIk18JRERF2.1
FT901N:CR:$1$3123$fzS/PyOPEt/TddFH4rlzv/
IT670C:CR:$1$3125$zRx/zleXjJ/Emix6dYh1C/
CE265S:CR:$1$3127$kkTdSiCt9uvNH7fDbYPJy.
IL439V:CR:$1$3130$oCvi3Z9atcIsT4xAvZJg/1
WB453E:CR:$1$3132$EONyQVbyXHr2efVvxmptv.
CZ118S:CR:$1$3134$H3.a2gfTwlK.TpoYiWYHX.
MU532M:CR:$1$3136$AWHlKPm2hoN0z1GqSnm9o1
PV912V:CR:$1$3138$g1nDucQD5KsPtmI6zrrz60
UN830W:CR:$1$3140$roIVdg4zNDURSa2BSHwuE1
TA944M:CR:$1$3142$VU3bQ73F3ZX6uOAv/d6R6/
IK127Z:CR:$1$3144$HY.hvwAyt17wL3ogLDF66.
PR988V:CR:$1$3146$ewDpizxABjKX/xeUc80mX/
ZW109B:CR:$1$3148$MeyYdd9f.cH3GvxvIj8Ft0
JT633O:CR:$1$3150$4PiEUEPVyOledmOAIQWuY1
GS473Y:CR:$1$3152$n7hOoAetZrpI/ubQHXHgP1
NK157Q:CR:$1$3154$FWDlFbuV8HiM9Tp9efMR00
TB385D:CR:$1$3156$F11JzeJ.ixB/1Jb5Q4OMq/
IM971O:CR:$1$3158$x60FyMFqgUwVA7a2i9idQ.
OY559F:CR:$1$3160$P/eAVWYcxkDrowa/EBpwe/
LJ295K:CR:$1$3162$ZuuUW4tgRCALErFlTwQHv0
EQ375Z:CR:$1$3164$N6mMavU7OwpfdK/FO4ixR0
GN374A:CR:$1$3166$qnmnAhbG/Lq/lCLjYPyqM.
UO369L:CR:$1$3168$j7YK8.P00sM1DLsQU2zyr/
BM530Q:CR:$1$3170$jwNJ/iPR1LNgJG.Bi8ejG0
WV276I:CR:$1$3172$HX2lOHN9SNcaKfEPju/kx.
BA179Y:CR:$1$3174$BIyXuQ1k/zrLe7KiK7TnH0
LM582B:CR:$1$3176$SdO3K5JpD1OdJ0.vkbzA41
SK311R:CR:$1$3178$/CZtilSfYC/KJ180Zfnn20
GV294F:CR:$1$3180$gzVoxg8cI2X/fhI9d12Sh.
RL784M:CR:$1$3182$.DqLWWHobMkv7tMqdjwN81
XO511C:CR:$1$3184$.wzpErHqvabOwttx2Laii1
EJ724M:CR:$1$3186$rIrUVQ9xpkP7CREQwN56f/
BS764R:CR:$1$3188$DWJ3lAN0kp1LKGohpg6PL.
FK629T:CR:$1$3190$4kdOPr8BBf4YsBNoZvbNH1
OE272B:CR:$1$3192$8uLU7Cz3/c3tIhOBBxQia/
TI529N:CR:$1$3194$Rku./jp9TSSS5MEX7ICHJ1
WB921O:CR:$1$3196$ffVEgstlfJzV5NzFhr.Uy/
XE588J:CR:$1$3198$EMpm.bbAVnCyhIKbVXu1E0
TU477M:CR:$1$3200$T4nwpSfbTk2vJR400zhkZ1
DV807F:CR:$1$3202$SNB2vrB8eYwu9RP35WOG80
MM620W:CR:$1$3204$rjvoxOoA5kwJxGbbPMnbf1
```