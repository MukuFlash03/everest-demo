#! /bin/sh
cat ./misc_test.txt
pip install pytest
pytest --everest-prefix ../build/dist core_tests/startup_tests.py 
