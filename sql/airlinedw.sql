CREATE TABLE AIRPLANE (
  id NUMBER(10) NOT NULL,
  airplane_type VARCHAR2(45) DEFAULT NULL NULL,
  departure_hour VARCHAR2(5) DEFAULT NULL NULL,
  arrival_hour VARCHAR2(5) DEFAULT NULL NULL,
  capacity NUMBER(10) DEFAULT NULL NULL,
  first_capacity NUMBER(10) DEFAULT NULL NULL,
  business_capacity NUMBER(10) DEFAULT NULL NULL,
  coach_capacity NUMBER(10) DEFAULT NULL NULL,
  PRIMARY KEY (id))
;

CREATE TABLE AIRPORT (
  id NUMBER(10) NOT NULL,
  airport_type VARCHAR2(45) DEFAULT NULL NULL,
  radar_type VARCHAR2(45) DEFAULT NULL NULL,
  city VARCHAR2(45) DEFAULT NULL NULL,
  state VARCHAR2(45) DEFAULT NULL NULL,
  name VARCHAR2(45) DEFAULT NULL NULL,
  PRIMARY KEY (id))
;

CREATE TABLE PAYMENT_CHANNEL (
  id NUMBER(10) NOT NULL,
  payment_type VARCHAR2(45) DEFAULT NULL NULL,
  PRIMARY KEY (id))
;

CREATE TABLE FARE (
  id NUMBER(10) NOT NULL,
  seat_type VARCHAR2(45) DEFAULT NULL NULL,
  description CLOB DEFAULT NULL NULL,
  restriction VARCHAR2(45) DEFAULT NULL NULL,
  PRIMARY KEY (id))
;

CREATE TABLE HOUR (
  id NUMBER(10) NOT NULL,
  hour VARCHAR2(10) DEFAULT NULL NULL,
  only_hour VARCHAR2(10) DEFAULT NULL NULL,
  time_of_day VARCHAR2(40) DEFAULT NULL NULL,
  PRIMARY KEY (id))
;

CREATE TABLE PASSENGER (
  id NUMBER(10) NOT NULL,
  client_type VARCHAR2(45) DEFAULT NULL NULL,
  city VARCHAR2(45) DEFAULT NULL NULL,
  state VARCHAR2(45) DEFAULT NULL NULL,
  name VARCHAR2(45) DEFAULT NULL NULL,
  address VARCHAR2(45) DEFAULT NULL NULL,
  zip VARCHAR2(45) DEFAULT NULL NULL,
  income VARCHAR2(45) DEFAULT NULL NULL,
  birth_date VARCHAR2(45) DEFAULT NULL NULL,
  marital_status VARCHAR2(45) DEFAULT NULL NULL,
  sex VARCHAR2(45) DEFAULT NULL NULL,
  PRIMARY KEY (id))
;

CREATE TABLE H_BOARDING_PASS (
  id_boarding_pass              NUMBER(10) NOT NULL,
  id_trip                       NUMBER(10) NOT NULL,
  id_leg_origin                 NUMBER(10) NOT NULL,
  id_leg_destination            NUMBER(10) NOT NULL,
  id_trip_origin                NUMBER(10) NOT NULL,
  id_trip_destination           NUMBER(10) NOT NULL,
  id_departure_hour             NUMBER(10) NOT NULL,
  id_arrival_hour               NUMBER(10) NOT NULL,
  id_airplane                   NUMBER(10) NOT NULL,
  id_payment_channel            NUMBER(10) NOT NULL,
  id_fare                       NUMBER(10) NOT NULL,
  id_passenger                  NUMBER(10) NOT NULL,
  base_fare         BINARY_DOUBLE DEFAULT NULL NULL,
  miles             NUMBER(10) DEFAULT NULL NULL,
  delay             NUMBER(10) DEFAULT NULL NULL,
  ticket_number     NUMBER(10) DEFAULT NULL NULL,
  PRIMARY KEY (id_leg_origin, id_leg_destination, id_trip_origin, id_trip_destination, id_departure_hour, id_arrival_hour, id_airplane, id_payment_channel, id_fare, id_passenger)
 ,
  CONSTRAINT sk_H
    UNIQUE (id_boarding_pass)
   ,
  CONSTRAINT fk_H_AIRPORT1
    FOREIGN KEY (id_leg_origin)
    REFERENCES AIRPORT (id)
   ,
  CONSTRAINT fk_H_AIRPORT2
    FOREIGN KEY (id_leg_destination)
    REFERENCES AIRPORT (id)
   ,
  CONSTRAINT fk_H_AIRPORT3
    FOREIGN KEY (id_trip_origin)
    REFERENCES AIRPORT (id)
   ,
  CONSTRAINT fk_H_AIRPORT4
    FOREIGN KEY (id_trip_destination)
    REFERENCES AIRPORT (id)
   ,
  CONSTRAINT fk_H_HOUR1
    FOREIGN KEY (id_departure_hour)
    REFERENCES HOUR (id)
   ,
  CONSTRAINT fk_H_HOUR2
    FOREIGN KEY (id_arrival_hour)
    REFERENCES HOUR (id)
   ,
  CONSTRAINT fk_H_AIRPLANE
    FOREIGN KEY (id_airplane)
    REFERENCES AIRPLANE (id)
   ,
  CONSTRAINT fk_H_PAYMENT
    FOREIGN KEY (id_payment_channel)
    REFERENCES PAYMENT_CHANNEL (id)
   ,
  CONSTRAINT fk_H_FARE
    FOREIGN KEY (id_fare)
    REFERENCES FARE (id)
   ,
  CONSTRAINT fk_H_PASSENGER
    FOREIGN KEY (id_passenger)
    REFERENCES PASSENGER (id)
   )
;