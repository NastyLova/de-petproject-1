create table analysis.dm_rfm_segments (
  user_id int4 primary key, -- идентификатор клиента, должен быть уникальным
  recency smallint not null, -- фактор по последней дате заказа
  frequency smallint not null, -- фактор по кол-ву заказов
  monetary_value smallint not null, -- фактор по сумме заказов
  CONSTRAINT dm_rfm_segments_recency_check CHECK (recency between 1 and 5),
  CONSTRAINT dm_rfm_segments_frequency_check CHECK (frequency between 1 and 5),
  CONSTRAINT dm_rfm_segments_monetary_value_check CHECK (monetary_value between 1 and 5)
);