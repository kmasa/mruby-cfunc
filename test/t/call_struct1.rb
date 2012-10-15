class STest < CFunc::Struct
  define CFunc::SInt8, :x,
    CFunc::SInt16, :y,
    CFunc::SInt32, :z
end

stest = STest.new

stest[:x] = 10
stest[:y] = 20
stest[:z] = 0

result = CFunc::call(STest, "cfunc_test_func1", stest)

assert result.is_a?(STest)
assert_equal 10, result[:x]
assert_equal 20, result[:y]
assert_equal 30, result[:z]


# BEGIN C
struct STest {
    int8_t x;
    int16_t y;
    int32_t z;
};

struct STest cfunc_test_func1(struct STest val) {
    val.z = val.x + val.y;
    return val;
};
