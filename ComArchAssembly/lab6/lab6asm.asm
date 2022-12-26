.586p
.MODEL FLAT, C
.CODE

PUBLIC C func1		
func1 PROC C USES EDI ESI,\
ArrNumber:DWORD, QuantNumber:DWORD, ArrInter1:DWORD, Xmin:DWORD

MOV EDI, ArrNumber		       ;����� ������� ��������� �����              
MOV ESI, ArrInter1	       ;����� ������� �������� ����� 
MOV ECX, QuantNumber	       ;����� ������� ��������� �����  
MOV EAX, Xmin			                                  
        
CYCLE:
	MOV EBX, [EDI]		           ;���������� ���������� ����� N
	SUB EBX, EAX	               ;��������� ����� ������� ���������
	ADD DWORD PTR[ESI+4*EBX], 1;   ;���������� �������� ����� �� 1
	ADD EDI, 4		               ;������� � ���������� �����
LOOP CYCLE		

RET 
func1 ENDP



PUBLIC C func2	
func2 PROC C USES EDI ESI,\                                        
ArrInter1:DWORD, ArrRightBorder:DWORD, ArrInterDif:DWORD,\
QuantBorder:DWORD, Xmin:DWORD

MOV EDI, ArrRightBorder     ;����� ������� ������ ������
MOV ESI, ArrInter1      ;����� ������� �������� �����
MOV EAX, ArrInterDif    ;����� ������� �������� ����������
MOV ECX, QuantBorder     ;���������� ��������� (����������)
MOV EBX, XMIN   


XOR EDX, EDX		   

CYCLE:
	CMP EBX, [EDI]	       
	JG NEXT_RANGE	      ;�������, ���� ����� ������ ������� �������
	ADD EDX, [ESI]        ;���������� 
	INC EBX               ;������� � ���������� ����� 
	ADD ESI, 4            ;������� � ���������� �������� �����. ����� � ��������� ����������
	JMP CYCLE
NEXT_RANGE:			      ;���������� ������ ������� ���������
	MOV [EAX], EDX        ;�������� � ������ � �������� �����. ����������� ��������
	XOR EDX, EDX          ;�������� ��������
	ADD EAX, 4	          ;������� � ��������� �������� �������
	ADD EDI, 4            ;������� � ��������� �������
LOOP CYCLE

RET
func2 ENDP
END
