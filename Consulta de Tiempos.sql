SELECT 
[UPL],
[ITEM CODE],
[REQUESTED QTY],
[PICKED QTY],
[SHIP TO],
[USER],
[REQUEST DATE],
MIN([WHS TIME]) 'WHS TIME',
MAX([WAITING TIME]) 'WAITING TIME',
[AGING],
[DETAIL]
FROM(
SELECT
[UPL], 
[Item Code],
[Requested Qty],
[Picked Qty],
CASE WHEN [Whs to] like '380392' then 'WIP'
WHEN [Whs to] like '380393' then 'Shipping'
WHEN [Whs to] like '380396' then 'MRB'
WHEN [Whs to] like '380398' then 'SMKT'
WHEN [Whs to] like '380403' then 'RTV'
WHEN [Whs to] like '380406' then 'RWK'
ELSE ''
END AS [Ship to],
[user],
CAST([Request Date] AS smalldatetime) [Request Date],
DATEDIFF(mi, [Request Date], [pick time]) as [WHS Time],
DATEDIFF(MI, [PICK TIME], GETDATE()) AS [Waiting Time],
DATEDIFF(mi, [Request Date], getdate()) as [Aging],
CASE WHEN [status] like '%UPL Printed%' then 'En proceso de surtido'
WHEN [status] like '%To be Released%' then 'Pendiente de liberacion'
WHEN [status] like '%To be Confirmed%' then 'Pendiente Recoleccion'
ELSE ''
END AS [Detail]
FROM            OPENQUERY(*******, 'select 
A.T$plis "UPL",
Trim(A.T$ITEM) "ITEM CODE",
A.T$oqty "REQUESTED QTY",
trim(A.T$STCO) "Whs To",
Decode(A.t$UPLS,32,''To be Released'',20,''UPL Printed'',50,''To be Confirmed'') "STATUS",
new_time(d.t$pdat, ''GMT'',''CST'') "Request Date",
new_time(e.t$trdt, ''GMT'',''CST'')  "Pick time",
b.T$qana "Picked Qty",
trim(F.T$Name) "user"
from baan.Tfxrpl041388 a
left join baan.tfxrpl013388 b on a.T$plis = b.T$plis and a.T$item = b.T$item
left join baan.tfxrpl012388 d on a.T$plis = d.T$plis
left join baan.Tfxrpl513388 E on A.T$plis = E.T$plis
left join Baan.Tttaad200000 F on D.T$user = F.T$User
WHERE a.T$sfco in (''380391'')
AND a.t$UPLS IN (''20'',''32'',''50'')
order by a.T$plis
')) a
WHERE [item code] not like 'FLX7-810%'
GROUP BY 
[UPL],
[ITEM CODE],
[REQUESTED QTY],
[PICKED QTY],
[SHIP TO],
[USER],
[REQUEST DATE],
[AGING],
[DETAIL]
order by [UPL] 