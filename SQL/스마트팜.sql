drop sequence harvest_id_sq;

create sequence harvest_id_sq increment by 1 start with 1;

INSERT INTO harvest (harv_id, harv_date, total_weight, harv_quality, crop_id) 
VALUES ('Y' || TO_CHAR(harvest_id_sq.NEXTVAL, 'fm000'), TO_DATE('2024-09-02', 'YYYY-MM-DD'), 500.5, 1, 'C001');


commit;