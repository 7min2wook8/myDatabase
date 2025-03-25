INSERT ALL
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U001', 'pw1', '김민준', 'user1@farm.com', '010-1234-5601', 'admin')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U002', 'pw2', '이서연', 'user2@farm.com', '010-1234-5602', 'admin')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U003', 'pw3', '박지훈', 'user3@farm.com', '010-1234-5603', 'admin')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U004', 'pw4', '최예린', 'user4@farm.com', '010-1234-5604', 'admin')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U005', 'pw5', '정우진', 'user5@farm.com', '010-1234-5605', 'admin')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U006', 'pw6', '강하늘', 'user6@farm.com', '010-1234-5606', 'worker')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U007', 'pw7', '윤지후', 'user7@farm.com', '010-1234-5607', 'worker')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U008', 'pw8', '장예은', 'user8@farm.com', '010-1234-5608', 'worker')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U009', 'pw9', '조하람', 'user9@farm.com', '010-1234-5609', 'worker')
  INTO users (user_id, pw, name, email, phone, role) VALUES ('U010', 'pw10', '한지호', 'user10@farm.com', '010-1234-5610', 'worker')
SELECT * FROM dual;

INSERT ALL
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000001', '서울특별시 스마트팜', '서울특별시', '김민준', 'U001', 4309, '전기', '양액')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000002', '부산광역시 스마트팜', '부산광역시', '이서연', 'U002', 3228, '전기', '양액')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000003', '대전광역시 스마트팜', '대전광역시', '박지훈', 'U003', 3051, '전기', '양액')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000004', '광주광역시 스마트팜', '광주광역시', '최예린', 'U004', 4518, '전기', '양액')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000005', '수원시 스마트팜', '수원시', '정우진', 'U005', 3563, '전기', '양액')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000006', '청주시 스마트팜', '청주시', '강하늘', 'U006', 3501, '전기', '양액')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000007', '전주시 스마트팜', '전주시', '윤지후', 'U007', 3457, '전기', '양액')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000008', '창원시 스마트팜', '창원시', '장예은', 'U008', 3285, '전기', '양액')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000009', '포항시 스마트팜', '포항시', '조하람', 'U009', 4508, '전기', '양액')
  INTO farm (farm_id, name, location, owner, user_id, scale, heating, cultivation) VALUES ('PF_0000010', '춘천시 스마트팜', '춘천시', '한지호', 'U010', 3209, '전기', '양액')
SELECT * FROM dual;

INSERT ALL
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000001', '토마토', '2024-11-23', '2025-04-09', '2025-05-08', 'PF_0000001')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000002', '토마토', '2024-08-27', '2024-12-22', '2024-12-24', 'PF_0000002')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000003', '토마토', '2023-04-06', '2023-07-18', '2023-07-26', 'PF_0000003')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000004', '딸기', '2024-07-28', '2024-11-07', '2024-11-30', 'PF_0000004')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000005', '파프리카', '2023-08-14', '2023-12-10', '2023-12-29', 'PF_0000005')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000006', '상추', '2023-01-07', '2023-05-25', '2023-06-20', 'PF_0000006')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000007', '파프리카', '2024-12-15', '2025-04-11', '2025-04-22', 'PF_0000007')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000008', '파프리카', '2023-06-09', '2023-09-20', '2023-10-15', 'PF_0000008')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000009', '토마토', '2023-04-15', '2023-07-19', '2023-08-01', 'PF_0000009')
  INTO crop (crop_id, name, planting_date, harvest_date, shipping_date, farm_id) VALUES ('CF_0000010', '파프리카', '2024-01-03', '2024-05-26', '2024-06-07', 'PF_0000010')
SELECT * FROM dual;

INSERT ALL
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000001', '2025-04-09', 433167, 1, 'CF_0000001')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000002', '2024-12-22', 392589, 4, 'CF_0000002')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000003', '2023-07-18', 291137, 1, 'CF_0000003')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000004', '2024-11-07', 493548, 4, 'CF_0000004')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000005', '2023-12-10', 51313, 5, 'CF_0000005')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000006', '2023-05-25', 163709, 5, 'CF_0000006')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000007', '2025-04-11', 474231, 3, 'CF_0000007')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000008', '2023-09-20', 312698, 2, 'CF_0000008')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000009', '2023-07-19', 379398, 1, 'CF_0000009')
  INTO yield (yield_id, harvest_date, total_weight, quality_grade, crop_id) VALUES ('YF_0000010', '2024-05-26', 34025, 2, 'CF_0000010')
SELECT * FROM dual;

INSERT ALL
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000001', '2025-03-02', 7.0, 25, 4, 'PF_0000001')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000002', '2023-04-14', 7.07, 49, 6, 'PF_0000002')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000003', '2023-06-16', 7.06, 33, 5, 'PF_0000003')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000004', '2024-12-19', 7.46, 61, 2, 'PF_0000004')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000005', '2024-09-15', 7.24, 54, 4, 'PF_0000005')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000006', '2023-06-17', 7.12, 37, 9, 'PF_0000006')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000007', '2023-08-13', 7.28, 73, 1, 'PF_0000007')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000008', '2023-08-23', 7.38, 71, 6, 'PF_0000008')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000009', '2024-02-15', 6.99, 33, 10, 'PF_0000009')
  INTO soildata (soil_id, soil_date, ph_level, moisture_level, nutrient_level, farm_id) VALUES ('SF_0000010', '2025-01-05', 7.02, 61, 8, 'PF_0000010')
SELECT * FROM dual;

INSERT ALL
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000001', 'PF_0000001', '2024-02-10', 27.1, 83, 96.7, 2649.3, 6166.4)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000002', 'PF_0000002', '2024-07-28', 24.3, 96, 120.5, 8977.4, 9985.6)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000003', 'PF_0000003', '2023-08-13', 28.0, 18, 106.3, 909.9, 1178.9)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000004', 'PF_0000004', '2023-04-23', 21.2, 21, 159.7, 4221.8, 1589.1)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000005', 'PF_0000005', '2024-01-26', 24.8, 60, 110.0, 9709.8, 21519.6)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000006', 'PF_0000006', '2023-01-12', 25.4, 15, 138.8, 5369.6, 6671.4)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000007', 'PF_0000007', '2024-10-18', 22.7, 38, 92.2, 4537.3, 23845.4)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000008', 'PF_0000008', '2025-01-06', 22.1, 65, 154.0, 5076.8, 2661.2)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000009', 'PF_0000009', '2024-10-02', 22.4, 82, 105.9, 1989.7, 9348.5)
  INTO weather (weather_id, farm_id, weather_date, temperature, humidity, rainfall, wind_speed, light) VALUES ('WF_0000010', 'PF_0000010', '2023-06-15', 24.3, 68, 183.6, 5989.2, 12215.7)
SELECT * FROM dual;
