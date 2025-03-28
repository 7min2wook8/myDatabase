set serveroutput on

create or replace procedure sfarm_login_p(
    get_user_ID in PRODUCER.user_ID % type,    --매개변수
    PW in PRODUCER.PW % type    --매개변수
)is 
    userid PRODUCER.user_ID % type;
    userPW PRODUCER.PW % type;
    begin
        select user_ID, PW into userid, userPW from PRODUCER
        where user_ID = get_user_ID;
        dbms_output.put_line('아이디' || userid);
        IF(userid = get_user_ID) then
        
            IF(userPW = PW) then
                dbms_output.put_line('로그인 성공!');
                
            else
                dbms_output.put_line('비밀번호가 틀립니다.');                
            end if;
            
        else   
            dbms_output.put_line('아이디가 틀립니다.');
            
        end if;
        
    exception
        when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
            
   end;
/

--exec sfarm_login_p('P001','aB3$dE1#');

--(작물의 수확량과 품질 등급을 등록하는 프로시저 제작)
create or replace procedure insert_haverst(
    cropid  in HARVEST.crop_id      %type,
    weight  in HARVEST.TOTAL_WEIGHT %type,   --매개변수
    quality in HARVEST.HARV_QUALITY %type    --매개변수
)is 
    
    begin
    
       insert INTO harvest (harv_id, harv_date, total_weight, harv_quality, crop_id) 
       VALUES ('Y' || TO_CHAR(harvest_id_sq.NEXTVAL, 'fm000'), sysdate, weight, quality, cropid);
       
        commit;
        dbms_output.put_line('데이터가 추가되었습니다.');
    exception
        when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
            
   end;
/
--exec insert_haverst('C003', 5000, 2);

--농장에 날씨와 토양 상태를 저장하는 프로시저
create or replace procedure insert_soildata_data(
   
    g_sysdate         in soildata.soil_date       %type,
    g_ph              in soildata.ph_level        %type,
    g_moisture        in soildata.moisture_level  %type,   
    g_nutrient        in soildata.nutrient_level  %type,
    g_farmID          in farm.farm_ID             %type
)is 
    
    begin
    
       insert INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) 
       VALUES ('S' || TO_CHAR(soildata_id_sq.NEXTVAL, 'fm000'), 
       g_sysdate, g_ph, g_moisture, g_nutrient, g_farmID);
       
        commit;
        dbms_output.put_line('soildata 데이터가 추가되었습니다.');
    exception
        when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
            
   end;
/

create or replace procedure insert_weather_data(
    g_sysdate         in weather.weather_date     %type,
    g_TEMPERATURE     in weather.TEMPERATURE      %type,
    g_HUMIDITY        in weather.HUMIDITY         %type,
    g_RAINFALL        in weather.RAINFALL         %type,
    g_WIND_SPEED      in weather.WIND_SPEED       %type,
    g_LIGHT           in weather.LIGHT            %type,
    g_farmID          in farm.farm_ID             %type
)is 
    
    begin
    --soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) 
    --VALUES ('S001', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 6.5, 40, 80, 'F001')
    
       insert INTO weather (
       WEATHER_ID, 
       WEATHER_DATE, 
       TEMPERATURE, 
       HUMIDITY, 
       RAINFALL, 
       WIND_SPEED,
       LIGHT, 
       farm_id) 
       VALUES (
       'S' || TO_CHAR(soildata_id_sq.NEXTVAL, 'fm000'),
       g_sysdate,
       g_TEMPERATURE,
       g_HUMIDITY, 
       g_RAINFALL, 
       g_WIND_SPEED, 
       g_LIGHT, 
       g_farmID);
        commit;
        dbms_output.put_line('weather 데이터가 추가되었습니다.');
    exception
        when others then
        --sqlcode : 에러 코드, sqlerrm : 에러 메세지
            dbms_output.put_line(sqlcode || sqlerrm);
            
   end;
/

--exec insert_soildata_data(sysdate,5.5,3,2,'F002');
--exec insert_weather_data(sysdate,1,1,1,1,1,'F002');

--생산량이 가장 많은 작물의 이름과 농장이름 출력해줘
create or replace procedure f_topweightcorpName_data is

    v_cname         crop.crop_name%type;
    v_farm_name     farm.farm_name%type;
    v_totalWeight   harvest.total_weight%TYPE;
    
    BEGIN
     select cr.CROP_NAME as "작물 이름", fa.FARM_NAME "농장 이름", (select max(total_weight) from harvest) "최대 무개(t)"
     into v_cname, v_farm_name, v_totalWeight
     from crop cr, farm fa
     where cr.farm_id = fa.farm_id and crop_id = (select crop_id 
                                                    from harvest 
                                                    where total_weight = (select max(total_weight) 
                                                                            from harvest));
                                                                            
    dbms_output.put_line('작물 이름 : ' || v_cname);
    dbms_output.put_line('농장 이름 : ' || v_farm_name);
    dbms_output.put_line('최고 무게 : ' || v_totalWeight);
    
    end;
/


exec f_topweightcorpName_data;

--select * from soildata so, weather we where so.soil_date = we.weather_date;
--select crop_id, harv_date, total_weight from harvest where total_weight = (select max(total_weight) from harvest);

--ID가 ???이 관리하는 농장의 날씨 데이터를 출력
create or replace procedure f_weatherView_data(
    g_ProducerName     in Producer.User_ID     %type
) is
    v_weather_date  weather.weather_date%TYPE;
    v_TEMPERATURE   weather.TEMPERATURE%TYPE;
    v_HUMIDITY      weather.HUMIDITY%TYPE;
    v_RAINFALL      weather.RAINFALL%TYPE;
    v_WIND_SPEED    weather.WIND_SPEED%TYPE;

    BEGIN
    
        dbms_output.put_line('날짜     |     온도   |     습도   |     강수량   |     풍량');
        for emprow in(
            select weather_date, TEMPERATURE, HUMIDITY, RAINFALL, WIND_SPEED           
            from weather we, farm fa, producer pr
            where we.farm_id = fa.farm_id and fa.user_id = pr.user_id and pr.user_name = g_ProducerName)
            
            loop            
            
                dbms_output.put_line(emprow.weather_date ||  '|   '   || emprow.TEMPERATURE|| '     |   '   || emprow.HUMIDITY||  '     |   '   ||emprow.RAINFALL|| '     |   '   || emprow.WIND_SPEED);
                
                              
            end loop;
    end;
/

exec f_weatherView_data('Irene Kwon');
--select we.weather_date, we.TEMPERATURE, we.HUMIDITY, we.RAINFALL, we.WIND_SPEED          
--            from weather we, farm fa, producer pr
--            where we.farm_id = fa.farm_id and fa.user_id = pr.user_id and pr.user_name ='Irene Kwon';
            
            
            