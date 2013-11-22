require "p10lppt13.rb"

describe Matriz do
        before :each do
                @m1 = Densa.new(2,2,[[1,2],[3,4]])
                @m2 = Densa.new(3,3,[[1,2,4],[6,5,8],[2,5,3]])
                @m3 = Dispersa.new(3,3, 0 => { 0 => 2, 2 => 1 })
                @m4 = Densa.new(3,3,[[-1,-2,-4],[-3,-5,-1],[-2,-5,-3]])
                @f1 = Fraccion.new(1,2)
                @f2 = Fraccion.new(3,2)
                @f3 = Fraccion.new(5,2)
                @mf1 = Densa.new(2,2,[[@f1,@f2],[@f3,@f1]])
                @mf2 = Densa.new(2,2,[[@f1,@f2],[@f1,@f2]])
        end

        # Comprobacion de que se crea bien la matriz
        describe "Comprobamos el numero de...\n" do
                it " - Filas para una matriz densa 3x3\n" do
                        @m2.nfil.should eq(3)
                end
                it " - Columnas de una matriz densa 3x3\n" do
                        @m2.ncol.should eq(3)
                end
                it "Acceso al elemento [0][0]" do
                        @m1.pos[0][0].should eq(1)
                end
                it "Acceso al elemento [0][1]" do
                        @m1.pos[0][1].should eq(2)
                end
                it "Acceso al elemento [1][0]" do
                        @m1.pos[1][0].should eq(3)
                end
                it "Acceso al elemento [1][1]" do
                        @m1.pos[1][1].should eq(4)
                end
                it " - Filas para una matriz dispersa 3x3\n" do
                        @m3.nfil.should eq(3)
                end
                it " - Columnas de una matriz dispersa 3x3\n" do
                        @m3.ncol.should eq(3)
                end
                it "Acceso al elemento [0][2]" do
                        @m3[0][2].should eq(1)
                end
        end
	
	 describe "Operaciones aritmeticas" do
            it "Suma de dos matrices densas" do
				@aux= @m1+@m1
				@aux.to_s.should eq("2\t4\t\n6\t8\t\n")
            end
		
			it "Suma de matriz densa y matriz dispersa" do
				@aux=@m2+@m3
				@aux.to_s.should eq("3\t2\t5\t\n6\t5\t8\t\n2\t5\t3\t\n")
            end
		
			it "Suma de dos matrices dispersas" do
				@aux=@m3+@m3
				@aux.to_s.should eq("4\t0\t2\t\n0\t0\t0\t\n0\t0\t0\t\n")
            end      
            it "Resta de dos matrices densas" do
				@aux= @m1+@m1
				@aux2 = @aux-@m1
				@aux2.to_s.should eq(@m1.to_s)
            end
		
			it "Resta de matriz densa y matriz dispersa" do
				@aux=@m2-@m3
				@aux.to_s.should eq("-1\t2\t3\t\n6\t5\t8\t\n2\t5\t3\t\n")
            end
		
			it "Resta de dos matrices dispersas" do
				@aux=@m3+@m3
				@aux2=@aux-@m3
				@aux2.to_s.should eq("2\t0\t1\t\n0\t0\t0\t\n0\t0\t0\t\n")
            end  
        end
        
        describe "Maximo y minimo" do
            it "Maximo dispersa" do
				@m3.max.to_s.should eq("2")
            end  
            it "Minimo dispersa" do
				@m3.min.to_s.should eq("0")
            end  
             it "Maximo densa" do
				@m1.max.to_s.should eq("4")
            end  
            it "Minimo densa" do
				@m1.min.to_s.should eq("1")
            end
            it "Maximo densa con valores negativos" do
				@m4.max.should eq(-1)
            end  
            it "Minimo densa con valores negativos" do
				@m4.min.should eq(-5)
            end 
        end
        
        describe "Operaciones con matrices con fracciones" do
			it "Comprobamos que realiza bien la traspuesta" do
				@aux = Densa.new(2,2,[[@f1,@f3],[@f2,@f1]])
				@mf1.trasponer.to_s.should eq(@aux.to_s)
			end
			it "Comprobamos la suma" do
				@aux = Densa.new(2,2,[[1,2],[3,4]])
				@af1 = Fraccion.new(3,2)
				@af2 = Fraccion.new(7,2)
				@af3 = Fraccion.new(11,2)
				@af4 = Fraccion.new(9,2)
				@aux3 = Densa.new(2,2,[[@af1,@af2],[@af3,@af4]])
				@aux2 = @aux+@mf1
				@aux2.to_s.should eq(@aux3.to_s)
			end
			it "Comprobamos la multiplicacion" do
				@aux = Densa.new(2,2,[[@f1,@f1],[@f1,@f1]])
				@aux2 = @aux.porf(@aux)
				@aux3 = Densa.new(2,2,[[@f1,@f1],[@f1,@f1]])
				@aux2.to_s.should eq(@aux3.to_s)
			end
=begin			it "Comprobamos el maximo" do
				@aux = Densa.new(2,2,[[@af1,1],[@af3,@af1]])
				@aux.max.should eq(@f3)
			end
=end
        end
        
end
