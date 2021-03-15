--查询用户登录记录 UTC时间 check User Login UTC--
SELECT 
         su.SystemUserId
        ,su.DomainName
        ,su.FullName
        ,a.CreatedOn 
    FROM Audit a
    INNER JOIN SystemUser su 
        on a.ObjectId = su.SystemUserId
    WHERE a.Operation = 4 
        and su.IsDisabled = 0
		and a.CreatedOn >'2021-01-01 00:00:00.000'
		and su.FullName!='crmadmin'

    