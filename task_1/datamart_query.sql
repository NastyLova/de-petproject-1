insert into analysis.dm_rfm_segments
select trr.user_id,
		trr.recency,
		trf.frequency,
		trmv.monetary_value
from analysis.tmp_rfm_recency trr
inner join analysis.tmp_rfm_frequency trf on trf.user_id = trr.user_id
inner join analysis.tmp_rfm_monetary_value trmv on trmv.user_id = trr.user_id;

0	1	3	4
1	4	3	3
2	2	3	5
3	2	3	3
4	4	3	3
5	5	5	5
6	1	3	5
7	4	2	2
8	1	1	3
9	1	3	2