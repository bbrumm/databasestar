CREATE OR REPLACE PACKAGE test_dividetwonumbers AS
  --%suite(Divide Two Numbers)
  
  --%test(Returns a number from a simple calculation)
  PROCEDURE basic_calc;
  
  --%test(Another test for calculating a division)
  PROCEDURE another_calc;
END;

CREATE OR REPLACE PACKAGE BODY test_dividetwonumbers AS
  PROCEDURE basic_calc AS
    v_actual NUMBER;
    v_expected NUMBER;
  BEGIN
    v_expected := 3;
    DivideTwoNumbers(15, 5, v_actual);
    ut.expect(v_actual).to_equal(v_expected);
  END;
  
  PROCEDURE another_calc AS
    v_actual NUMBER;
    v_expected NUMBER;
  BEGIN
    v_expected := 70;
    DivideTwoNumbers(14, 2, v_actual);
    ut.expect(v_actual).to_equal(v_expected);
  END;
END;



BEGIN
  ut.run('test_dividetwonumbers');
END;

/*
Add test of divide by zero
*/


CREATE OR REPLACE PACKAGE test_dividetwonumbers AS
  --%suite(Divide Two Numbers)
  
  --%test(Returns a number from a simple calculation)
  PROCEDURE basic_calc;
  
  --%test(Another test for calculating a division)
  PROCEDURE another_calc;
  
  --%test(Divide by zero)
  PROCEDURE divide_by_zero;
END;

CREATE OR REPLACE PACKAGE BODY test_dividetwonumbers AS
  PROCEDURE basic_calc AS
    v_actual NUMBER;
    v_expected NUMBER;
  BEGIN
    v_expected := 3;
    DivideTwoNumbers(15, 5, v_actual);
    ut.expect(v_actual).to_equal(v_expected);
  END;
  
  PROCEDURE another_calc AS
    v_actual NUMBER;
    v_expected NUMBER;
  BEGIN
    v_expected := 7;
    DivideTwoNumbers(14, 2, v_actual);
    ut.expect(v_actual).to_equal(v_expected);
  END;
  
  PROCEDURE divide_by_zero AS
    v_actual NUMBER;
    v_expected NUMBER;
  BEGIN
    v_expected := 0;
    DivideTwoNumbers(11, 0, v_actual);
    ut.expect(v_actual).to_equal(v_expected);
  END;
END;


BEGIN
  ut.run('test_dividetwonumbers');
END;
