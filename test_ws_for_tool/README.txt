Các file cần chú ý trong folder này:

1. data_create_learn_00.bat
- File batch này sẽ tạo ra các file .txt chứa data từ từng file .hex (memory của bộ nhớ ECU IFX chứa data về test) trong folder
- Sau đó, tiếp tục tạo ra các file data có đuôi .dat từ file txt trên


2. ctc_gen_learn_00.bat
- File batch này add tên toàn bộ file MON.sym và MON.dat vào trên cùng một dòng để thực hiện lệnh gen ctc trong định dạng txt

3. ctc2html_help.txt: Help về cách sử dụng file batch ctc2html.bat
4. test_for_in_bat.bat: Test về cách sử dụng vòng for để lưu tên mọi file hex trong folder
5. mytest.sh: Test của file bash trong linux về vòng for và echo. Chỉ chạy được khi mở Ubuntu trên win
	testt.sh: BUG :)

6. Các file MON, CTCHTML, combined_coverage.txt là các file gen ra bằng tay để test final tool trong folder final_test

7. Trong final test, các file data_create.bat và ctc_gen.bat là các file test từng stage 1 và stage 2 trong final bat: CTC_GEN_DEV_01.BAT