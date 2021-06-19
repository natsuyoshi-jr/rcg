# What is this tool?
This script changes terminal string color and background color when you monitor log with tail command.<br>
I think that this script will help to notice error when you monitor log.

# Installation
```
git clone -b master https://github.com/masaharu-suizu/rcg.git
```

# Requirement
Perl v5.8+


# Usage
Please use in combination with tail command. <br>
Like below.
```
$ tail -f dev.log | perl rcg.pl '.*ERR.*' 'BOLD WHITE ON_RED' '.*DEBUG.*' 'BOLD GREEN'
```

![](https://github.com/natsuyoshi-jr/image/blob/master/rcg.png?raw=true)

About argument to rcg.pl, please set regex and color.

```
perl rcg.pl [regex] [color] [regex] [color] ...
```

As color params, we can use constant of Perl Term::ANSIColor. <br>
About constant of Term::ANSIColor, please refer to [Term::ANSIColor](http://perldoc.perl.org/Term/ANSIColor.html#Constant-Interface) page.


# License
MIT
