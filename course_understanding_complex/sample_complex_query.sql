SELECT trim(imlitm) AS "ITEM",   trim(imdsc1)      AS "DESC" , trim(imsrtx)      AS "PRODUCT", IMSRP4,
  trim(IMSLD)                                      AS "SHELF-DAYS",  lipqoh/10000                                     AS "QTY",
  --(select innq06 from f41112 where initm = liitm and inmcu=limcu and lilotn=inlotn and inlocn=lilocn and infy=19 and inctry=20 and indct='BF' and innq06 !=0)/10000 as "AO QTY",
  liqttr/10000   AS " In Transit",  trim(lilocn)   AS "LOCATION" ,  trim(comcu)      AS "BRANCH",
  ROUND( ((councs/10000)*CXCRRD),4)      AS "COST",  ROUND(((COUNCS /10000)*(LIPQOH/10000)*CXCRRD),2) AS "VALUE",
  trim(iolotn)           AS "BATCH",
  (select to_date(to_char(1900000 + iobodj), 'yyyyddd') as gregorian_date from dual) as "MFG-DT",
  (select to_date(to_char(1900000 + iommej), 'yyyyddd') as gregorian_date from dual) as "EXPY-DT",
  --iommej              AS "EXP-DT",
  cxcrrd    AS "CONV-RT",
  cxcrdc  AS "CURR",
  cxcrcd ,
  cxcrr,
  --(cxeft)     AS "LATEST-XCH" ,
  (select to_date(to_char(1900000 + cxeft), 'yyyyddd') as gregorian_date from dual) as "CURR-EFF-DT",
  ROUND(((COUNCS/10000)*(LIqttr/10000)*CXCRRD),2) AS "GIT VALUE",  (LIHCOM       +LIPCOM)/10000     AS "ORDERS",
  ROUND(((COUNCS/10000)*((LIPCOM+LIHCOM)/10000)*CXCRRD),2) AS "ORDER VAL" ,  (LIPCOM       /10000)   AS SOFT ,
  (LIHCOM       /10000)    AS HARD,
  (select max((select((to_date(to_char(1900000 + PRRCDJ), 'yyyyddd'))) from dual)) from f43121 where ioitm=pritm and iomcu=prmcu and iolotn=prlotn and prrcdj>0) as "LAST RECEIPT DATE",
  --(select max(prrcdj) from f43121 where ioitm=pritm and iomcu=prmcu and iolotn=prlotn) as "LAST RECEIPT DATE",
  (select sum(sdsoqs) from f4211 where sdtrdj> 119182 and sdglc in ('IN30','IN31') and sddcto in ('SO','SI') and sdlnty='S' and liitm=sditm and limcu=sdmcu and sdsocn = 0 )/10000 as "TTM"
--,(select f.iommej from f4108 f
--  Inner join f4108 g on f.ioitm=g.ioitm
--  --and a.iomcu=b.iomcu
--  and g.iolotn=g.iolotn
--
--where f.iomcu = '      120WHS'
--and f.iobodj != g.iobodj
--and f.iobodj> 119182
--and f.ioitm in (select h.liitm from f41021 h where h.liitm=f.ioitm and h.lilotn=g.iolotn and h.limcu!= '      120WHS' and h.lipqoh>0)) as "MFG-DT-NEW"
--and (select b.ioitm from f41021 where a.ioitm in (select c.liitm from f41021 c where c.liitm=b.ioitm and c.limcu=b.iomcu and c.lilotn =b.iolotn)
FROM F41021 a,  f4108 b,  f4105 c,  f4101 d,  f0015 e
WHERE
  -- IM Item Master
  -- LO Location Qty
  -- CO Cost
  -- IO Lot
  --IM Join
  imitm   = liitm AND imitm = ioitm AND imitm = coitm AND
  -- Location Join
  liitm    = ioitm AND limcu  = iomcu AND lilotn = iolotn AND liitm  = coitm AND limcu  = comcu AND cocsin = 'I' AND cxan8  = 0 AND cxcrcd = 'USD'
  AND cxeft in (select max(cxeft) from f0015 where cxcrdc = (select cccrcd from F0010 where ccco = (select distinct mcco from F0006 where mcmcu= limcu and iomcu=limcu and comcu=limcu) ))
--and cxeft=120216 and cxcrdc='RMB'
AND cxcrdc =
  (SELECT cccrcd
  FROM F0010
  WHERE ccco =
    (SELECT DISTINCT mcco FROM F0006 WHERE mcmcu= limcu
    )
  )
AND (lipqoh           + liqttr) > 0
--and limcu in ('      114PNB','      114PNC','      114WHS')
AND liglpt           IN ('IN30','IN31') --and lilocn  like '%FG%'
--Order by BRANCH,PRODUCT,ITEM,BATCH
--AND LIMCU='      103WHS'
