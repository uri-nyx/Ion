struct T {
        int res;
        int (*f)();
};

int F(int a, int b, int c)
{
        return a + b + c;
}


int main()
{
        int (*t)();
        t = F;
        return t(1, 2, 3);
}
