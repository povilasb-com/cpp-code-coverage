#include <gtest/gtest.h>

#include "lib1.hpp"



TEST(lib1, sum)
{
	int s = sum(10, 15);
	ASSERT_TRUE(s == 25);
}

TEST(lib1, mul)
{
	int m = mul(10, 15);
	ASSERT_TRUE(m == 150);
}
