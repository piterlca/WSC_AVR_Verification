@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\Users\Piotr\workspace\vlsi\vlsi_mcu\VLSI_MCU\labels.tmp" -fI -W+ie -o "C:\Users\Piotr\workspace\vlsi\vlsi_mcu\VLSI_MCU\vlsi.hex" -d "C:\Users\Piotr\workspace\vlsi\vlsi_mcu\VLSI_MCU\vlsi.obj" -e "C:\Users\Piotr\workspace\vlsi\vlsi_mcu\VLSI_MCU\vlsi.eep" -m "C:\Users\Piotr\workspace\vlsi\vlsi_mcu\VLSI_MCU\vlsi.map" "C:\Users\Piotr\workspace\vlsi\vlsi_mcu\VLSI_MCU\vlsi.asm"