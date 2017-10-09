# Oracle APEX Region Plugin - PictoChart
Region Plugin to demonstrate the integration of JET Charts not currently exposed in APEX.


## Changelog

#### 1.0.0 - Initial Release


## Install

- Import Plugin File **region_type_plugin_com_apexconsulting_apex_jet_pictochart.sql** from the main directory into your Application
- (Optional) Deploy the JS file from the **server/js** Directory on your Webserver and change the **File Prefix** to Webservers Folder.


## Plugin Settings

The implemented Plugin Settings (you could at many more):
- **animationOnDisplay** - the animation used when initializing the plugin
- **columnCount** - The number of columns used within the chart
- **layout** - Either horizontal or vertical

## How to use
- Create a new Region based on the Plugin
- Add a SQL Statement like the example below. As this is the easiest example possible, you have to name the columns exactly like the example (both naming and lowercase). These column aliases are used to cosntruct the correct JSON object.
```
select ename||' - '||job||'@'||dname "name"
,      'human' "shape"
,      1 "count"
,      case job
       when 'PRESIDENT' then 'black'
       when 'ANALYST'   then 'blue'
       when 'CLERK'     then 'green'
       when 'MANAGER'   then 'red'
       when 'SALESMAN'  then 'yellow'
       end "color"
from   emp
       join dept on emp.deptno = dept.deptno
order by 2 desc, 4
```

## Demo Application
[https://apex.oracle.com/pls/apex/f?p=ROELSAPEXJET:PICTO](https://apex.oracle.com/pls/apex/f?p=ROELSAPEXJET:PICTO)


## Preview
## ![](https://github.com/ApexGru/JET-PictoChart/preview.gif)
