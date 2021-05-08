--查询包括选项集的显示名称
select 
accountnumber as 客户编号,
a.Name as 客户名称,
h.new_name as 客户行业,
h2.new_name as 行业细分,
a.CreatedOn as 创建日期,
ly.Value as 来源,
sf.new_name as 省份,
cs.new_name as 城市,
xz.Value as 性质

from AccountBase a left join dbo.new_industryBase h  on a.new_c_industry=h.new_industryId
left join dbo.new_industryBase h2  on a.new_c_subindusty=h2.new_industryId
left join dbo.new_regionBase sf  on a.new_c_province=sf.new_regionId
left join dbo.new_regionBase cs  on a.new_c_city=cs.new_regionId
left join (select AttributeValue, Value
from StringMap
where ObjectTypeCode = 1 -- entity type code, 1 = account
and AttributeName = 'new_c_kind') xz on a.new_c_kind=xz.AttributeValue
left join (select AttributeValue, Value
from StringMap
where ObjectTypeCode = 1 -- entity type code, 1 = account
and AttributeName = 'new_c_source') ly on a.new_c_source=ly.AttributeValue
where a.statecode='0' and h.statecode='0'