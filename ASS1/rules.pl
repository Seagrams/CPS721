call(1,saturday,2200,11).
call(2,tuesday,700,9).
call(3,wednesday,400,12).
call(4,sunday,1300,9).
call(5,friday,2300,6).
call(6,tuesday,2300,11).

day(T) :- T >= 500, T =< 2000.
night(T) :- not day(T).
weekend(Day,Time) :- Day = saturday.
weekend(Day,Time) :- Day = sunday.
weekend(Day,Time) :- Day = friday, Time >= 2350.
weekday(Day,Time) :- not weekend(Day,Time).
rate(Day,Time,R) :- R = 5, weekend(Day, Time).
rate(Day,Time,R) :- R = 7, weekday(Day,Time), night(Time).
rate(Day,Time,R) :- R = 9, weekday(Day,Time).
surcharge(S) :- S = 25.
overtime(Duration) :- Duration > 10.
price(N,P) :- call(N,Day,Time,Duration), rate(Day,Time,R), not overtime(Duration), P is R*Duration.
price(N,P) :- call(N,Day,Time,Duration), rate(Day,Time,R), overtime(Duration), surcharge(S), P is (R*Duration + S*(Duration - 10)).