require_relative '../solver'

describe Solver do
  solver = Solver.new

  it 'Should test factorial' do
    expect(solver.factorial(0)).to eq 1
    expect(solver.factorial(1)).to eq 1
    expect(solver.factorial(5)).to eq 120
    expect { solver.factorial(-1) }.to raise_error(ArgumentError, "Argument must be a non-negative integer")
    expect { solver.factorial(1.5) }.to raise_error(ArgumentError, "Argument must be a non-negative integer")
    expect { solver.factorial(nil) }.to raise_error(ArgumentError, "Argument must be a non-negative integer")
    expect { solver.factorial("hello") }.to raise_error(ArgumentError, "Argument must be a non-negative integer")
  end

  it 'Should test reverse' do
    expect(solver.reverse("hello")).to eq "olleh"
    expect(solver.reverse("")).to eq ""
    expect(solver.reverse("racecar")).to eq "racecar"
  end

  it 'Should test fizzbuzz' do
    expect(solver.fizzbuzz(15)).to eq "fizzbuzz"
    expect(solver.fizzbuzz(9)).to eq "fizz"
    expect(solver.fizzbuzz(10)).to eq "buzz"
    expect(solver.fizzbuzz(7)).to eq "7"
  end
end
