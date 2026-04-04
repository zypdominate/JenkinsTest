import pytest


class TestBase:
    @pytest.fixture(scope='class', autouse=True)
    def init(self, request):
        print(f"Init fixture executing, self is: {self}")
        print(f"Request.cls is: {request.cls}")
        request.cls.base = "base"  # 确保设置在类上而不是实例上


class TestDerived(TestBase):
    def test_derived(self):
        print(f"In test_derived, self is: {self}")
        print(f"self.__class__.base is: {getattr(self.__class__, 'base', 'NOT_FOUND')}")
        assert hasattr(self.__class__, 'base')
        assert self.__class__.base == "base"
        assert self.base == "base"

    def test_derived2(self):
        print(f"In test_derived2, self is: {self}")
        assert self.base == "base"
