/**
 * @author aan2001
 * @date %date%
 */

#include <bits/stdc++.h>

using namespace std;

#define all(x) (x).begin(), (x).end()
#define F_OR(i, start, stop, step) for (int i=(start); (step)>0?i<(stop):i>(stop); i+=(step))
#define F_OR1(stop) F_OR(i, 0, stop, 1)
#define F_OR2(i, stop) F_OR(i, 0, stop, 1)
#define F_OR3(i, start, stop) F_OR(i, start, stop, 1)
#define F_OR4(i, start, stop, step) F_OR(i, start, stop, stop)
#define GET5(a, b, c, d, e, ...) e
#define F_ORC(...) GET5(__VA_ARGS__, F_OR4, F_OR3, F_OR2, F_OR1)
#define FOR(...) F_ORC(__VA_ARGS__)(__VA_ARGS__)
#define EACH(x, a) for (auto& x: a)

// debugging
#ifdef _DEBUG
template < typename F, typename S >
ostream& operator << ( ostream& os, const pair< F, S > & p ) {
    return os << "(" << p.first << ", " << p.second << ")";
}

template < typename T >
ostream &operator << ( ostream & os, const vector< T > &v ) {
    os << "{";
    typename vector< T > :: const_iterator it;
    for( it = v.begin(); it != v.end(); it++ ) {
        if( it != v.begin() ) os << ", ";
        os << *it;
    }
    return os << "}";
}

template < typename T >
ostream &operator << ( ostream & os, const set< T > &v ) {
    os << "[";
    typename set< T > :: const_iterator it;
    for ( it = v.begin(); it != v.end(); it++ ) {
        if( it != v.begin() ) os << ", ";
        os << *it;
    }
    return os << "]";
}

template < typename F, typename S >
ostream &operator << ( ostream & os, const map< F, S > &v ) {
    os << "[";
    typename map< F , S >::const_iterator it;
    for( it = v.begin(); it != v.end(); it++ ) {
        if( it != v.begin() ) os << ", ";
        os << it -> first << " = " << it -> second ;
    }
    return os << "]";
}

#define debug(x) cerr << #x << " = " << x << endl;
#else
#define debug(x)
#endif

using vi = vector<int>;
using vii = vector<vi>;
using pi = pair<int, int>;
using ll = long long;

static constexpr double EPS = 1.0e-9;
static constexpr int d4i[4] = {-1, 0, 1, 0}, d4j[4] = {0, 1, 0, -1};
static constexpr int d8i[8] = {-1, -1, 0, 1, 1, 1, 0, -1}, d8j[8] = {0, 1, 1, 1, 0, -1, -1, -1};


int main() {
    ios::sync_with_stdio(false);
    cin.tie(0);
    /*== solution ==*/

}