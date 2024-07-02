/*
Create an empty package
*/
CREATE OR REPLACE PACKAGE test_dividetwonumbers AS
  --%suite(Divide Two Numbers)
  
END;



/*
Run all tests
*/
BEGIN
  ut.run();
END;


/*
Add a single test
*/
CREATE OR REPLACE PACKAGE test_dividetwonumbers AS
  --%suite(Divide Two Numbers)
  
  --%test(Returns a number from a simple calculation)
  PROCEDURE basic_calc;
END;

DROP PACKAGE BODY test_dividetwonumbers;
/*
Run just this test
*/
BEGIN
  ut.run('test_dividetwonumbers');
END;


/*
Add body for first test
*/

CREATE OR REPLACE PACKAGE BODY test_dividetwonumbers AS
  PROCEDURE basic_calc AS
    v_actual NUMBER;
    v_expected NUMBER;
  BEGIN
    v_expected := 3;
    DivideTwoNumbers(15, 5, v_actual);
    ut.expect(v_actual).to_equal(v_expected);
  END;
END;


/*
Run just this test
*/
BEGIN
  ut.run('test_dividetwonumbers');
END;
