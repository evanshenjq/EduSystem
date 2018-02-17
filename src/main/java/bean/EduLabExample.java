package bean;

import java.util.ArrayList;
import java.util.List;

public class EduLabExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public EduLabExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andLIdIsNull() {
            addCriterion("l_id is null");
            return (Criteria) this;
        }

        public Criteria andLIdIsNotNull() {
            addCriterion("l_id is not null");
            return (Criteria) this;
        }

        public Criteria andLIdEqualTo(Long value) {
            addCriterion("l_id =", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdNotEqualTo(Long value) {
            addCriterion("l_id <>", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdGreaterThan(Long value) {
            addCriterion("l_id >", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdGreaterThanOrEqualTo(Long value) {
            addCriterion("l_id >=", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdLessThan(Long value) {
            addCriterion("l_id <", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdLessThanOrEqualTo(Long value) {
            addCriterion("l_id <=", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdIn(List<Long> values) {
            addCriterion("l_id in", values, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdNotIn(List<Long> values) {
            addCriterion("l_id not in", values, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdBetween(Long value1, Long value2) {
            addCriterion("l_id between", value1, value2, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdNotBetween(Long value1, Long value2) {
            addCriterion("l_id not between", value1, value2, "lId");
            return (Criteria) this;
        }

        public Criteria andLNameIsNull() {
            addCriterion("l_name is null");
            return (Criteria) this;
        }

        public Criteria andLNameIsNotNull() {
            addCriterion("l_name is not null");
            return (Criteria) this;
        }

        public Criteria andLNameEqualTo(String value) {
            addCriterion("l_name =", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameNotEqualTo(String value) {
            addCriterion("l_name <>", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameGreaterThan(String value) {
            addCriterion("l_name >", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameGreaterThanOrEqualTo(String value) {
            addCriterion("l_name >=", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameLessThan(String value) {
            addCriterion("l_name <", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameLessThanOrEqualTo(String value) {
            addCriterion("l_name <=", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameLike(String value) {
            addCriterion("l_name like", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameNotLike(String value) {
            addCriterion("l_name not like", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameIn(List<String> values) {
            addCriterion("l_name in", values, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameNotIn(List<String> values) {
            addCriterion("l_name not in", values, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameBetween(String value1, String value2) {
            addCriterion("l_name between", value1, value2, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameNotBetween(String value1, String value2) {
            addCriterion("l_name not between", value1, value2, "lName");
            return (Criteria) this;
        }

        public Criteria andLNumIsNull() {
            addCriterion("l_num is null");
            return (Criteria) this;
        }

        public Criteria andLNumIsNotNull() {
            addCriterion("l_num is not null");
            return (Criteria) this;
        }

        public Criteria andLNumEqualTo(String value) {
            addCriterion("l_num =", value, "lNum");
            return (Criteria) this;
        }

        public Criteria andLNumNotEqualTo(String value) {
            addCriterion("l_num <>", value, "lNum");
            return (Criteria) this;
        }

        public Criteria andLNumGreaterThan(String value) {
            addCriterion("l_num >", value, "lNum");
            return (Criteria) this;
        }

        public Criteria andLNumGreaterThanOrEqualTo(String value) {
            addCriterion("l_num >=", value, "lNum");
            return (Criteria) this;
        }

        public Criteria andLNumLessThan(String value) {
            addCriterion("l_num <", value, "lNum");
            return (Criteria) this;
        }

        public Criteria andLNumLessThanOrEqualTo(String value) {
            addCriterion("l_num <=", value, "lNum");
            return (Criteria) this;
        }

        public Criteria andLNumLike(String value) {
            addCriterion("l_num like", value, "lNum");
            return (Criteria) this;
        }

        public Criteria andLNumNotLike(String value) {
            addCriterion("l_num not like", value, "lNum");
            return (Criteria) this;
        }

        public Criteria andLNumIn(List<String> values) {
            addCriterion("l_num in", values, "lNum");
            return (Criteria) this;
        }

        public Criteria andLNumNotIn(List<String> values) {
            addCriterion("l_num not in", values, "lNum");
            return (Criteria) this;
        }

        public Criteria andLNumBetween(String value1, String value2) {
            addCriterion("l_num between", value1, value2, "lNum");
            return (Criteria) this;
        }

        public Criteria andLNumNotBetween(String value1, String value2) {
            addCriterion("l_num not between", value1, value2, "lNum");
            return (Criteria) this;
        }

        public Criteria andLStimeIsNull() {
            addCriterion("l_stime is null");
            return (Criteria) this;
        }

        public Criteria andLStimeIsNotNull() {
            addCriterion("l_stime is not null");
            return (Criteria) this;
        }

        public Criteria andLStimeEqualTo(String value) {
            addCriterion("l_stime =", value, "lStime");
            return (Criteria) this;
        }

        public Criteria andLStimeNotEqualTo(String value) {
            addCriterion("l_stime <>", value, "lStime");
            return (Criteria) this;
        }

        public Criteria andLStimeGreaterThan(String value) {
            addCriterion("l_stime >", value, "lStime");
            return (Criteria) this;
        }

        public Criteria andLStimeGreaterThanOrEqualTo(String value) {
            addCriterion("l_stime >=", value, "lStime");
            return (Criteria) this;
        }

        public Criteria andLStimeLessThan(String value) {
            addCriterion("l_stime <", value, "lStime");
            return (Criteria) this;
        }

        public Criteria andLStimeLessThanOrEqualTo(String value) {
            addCriterion("l_stime <=", value, "lStime");
            return (Criteria) this;
        }

        public Criteria andLStimeLike(String value) {
            addCriterion("l_stime like", value, "lStime");
            return (Criteria) this;
        }

        public Criteria andLStimeNotLike(String value) {
            addCriterion("l_stime not like", value, "lStime");
            return (Criteria) this;
        }

        public Criteria andLStimeIn(List<String> values) {
            addCriterion("l_stime in", values, "lStime");
            return (Criteria) this;
        }

        public Criteria andLStimeNotIn(List<String> values) {
            addCriterion("l_stime not in", values, "lStime");
            return (Criteria) this;
        }

        public Criteria andLStimeBetween(String value1, String value2) {
            addCriterion("l_stime between", value1, value2, "lStime");
            return (Criteria) this;
        }

        public Criteria andLStimeNotBetween(String value1, String value2) {
            addCriterion("l_stime not between", value1, value2, "lStime");
            return (Criteria) this;
        }

        public Criteria andLEtimeIsNull() {
            addCriterion("l_etime is null");
            return (Criteria) this;
        }

        public Criteria andLEtimeIsNotNull() {
            addCriterion("l_etime is not null");
            return (Criteria) this;
        }

        public Criteria andLEtimeEqualTo(String value) {
            addCriterion("l_etime =", value, "lEtime");
            return (Criteria) this;
        }

        public Criteria andLEtimeNotEqualTo(String value) {
            addCriterion("l_etime <>", value, "lEtime");
            return (Criteria) this;
        }

        public Criteria andLEtimeGreaterThan(String value) {
            addCriterion("l_etime >", value, "lEtime");
            return (Criteria) this;
        }

        public Criteria andLEtimeGreaterThanOrEqualTo(String value) {
            addCriterion("l_etime >=", value, "lEtime");
            return (Criteria) this;
        }

        public Criteria andLEtimeLessThan(String value) {
            addCriterion("l_etime <", value, "lEtime");
            return (Criteria) this;
        }

        public Criteria andLEtimeLessThanOrEqualTo(String value) {
            addCriterion("l_etime <=", value, "lEtime");
            return (Criteria) this;
        }

        public Criteria andLEtimeLike(String value) {
            addCriterion("l_etime like", value, "lEtime");
            return (Criteria) this;
        }

        public Criteria andLEtimeNotLike(String value) {
            addCriterion("l_etime not like", value, "lEtime");
            return (Criteria) this;
        }

        public Criteria andLEtimeIn(List<String> values) {
            addCriterion("l_etime in", values, "lEtime");
            return (Criteria) this;
        }

        public Criteria andLEtimeNotIn(List<String> values) {
            addCriterion("l_etime not in", values, "lEtime");
            return (Criteria) this;
        }

        public Criteria andLEtimeBetween(String value1, String value2) {
            addCriterion("l_etime between", value1, value2, "lEtime");
            return (Criteria) this;
        }

        public Criteria andLEtimeNotBetween(String value1, String value2) {
            addCriterion("l_etime not between", value1, value2, "lEtime");
            return (Criteria) this;
        }

        public Criteria andLPlaceIsNull() {
            addCriterion("l_place is null");
            return (Criteria) this;
        }

        public Criteria andLPlaceIsNotNull() {
            addCriterion("l_place is not null");
            return (Criteria) this;
        }

        public Criteria andLPlaceEqualTo(String value) {
            addCriterion("l_place =", value, "lPlace");
            return (Criteria) this;
        }

        public Criteria andLPlaceNotEqualTo(String value) {
            addCriterion("l_place <>", value, "lPlace");
            return (Criteria) this;
        }

        public Criteria andLPlaceGreaterThan(String value) {
            addCriterion("l_place >", value, "lPlace");
            return (Criteria) this;
        }

        public Criteria andLPlaceGreaterThanOrEqualTo(String value) {
            addCriterion("l_place >=", value, "lPlace");
            return (Criteria) this;
        }

        public Criteria andLPlaceLessThan(String value) {
            addCriterion("l_place <", value, "lPlace");
            return (Criteria) this;
        }

        public Criteria andLPlaceLessThanOrEqualTo(String value) {
            addCriterion("l_place <=", value, "lPlace");
            return (Criteria) this;
        }

        public Criteria andLPlaceLike(String value) {
            addCriterion("l_place like", value, "lPlace");
            return (Criteria) this;
        }

        public Criteria andLPlaceNotLike(String value) {
            addCriterion("l_place not like", value, "lPlace");
            return (Criteria) this;
        }

        public Criteria andLPlaceIn(List<String> values) {
            addCriterion("l_place in", values, "lPlace");
            return (Criteria) this;
        }

        public Criteria andLPlaceNotIn(List<String> values) {
            addCriterion("l_place not in", values, "lPlace");
            return (Criteria) this;
        }

        public Criteria andLPlaceBetween(String value1, String value2) {
            addCriterion("l_place between", value1, value2, "lPlace");
            return (Criteria) this;
        }

        public Criteria andLPlaceNotBetween(String value1, String value2) {
            addCriterion("l_place not between", value1, value2, "lPlace");
            return (Criteria) this;
        }

        public Criteria andLPeopleIsNull() {
            addCriterion("l_people is null");
            return (Criteria) this;
        }

        public Criteria andLPeopleIsNotNull() {
            addCriterion("l_people is not null");
            return (Criteria) this;
        }

        public Criteria andLPeopleEqualTo(String value) {
            addCriterion("l_people =", value, "lPeople");
            return (Criteria) this;
        }

        public Criteria andLPeopleNotEqualTo(String value) {
            addCriterion("l_people <>", value, "lPeople");
            return (Criteria) this;
        }

        public Criteria andLPeopleGreaterThan(String value) {
            addCriterion("l_people >", value, "lPeople");
            return (Criteria) this;
        }

        public Criteria andLPeopleGreaterThanOrEqualTo(String value) {
            addCriterion("l_people >=", value, "lPeople");
            return (Criteria) this;
        }

        public Criteria andLPeopleLessThan(String value) {
            addCriterion("l_people <", value, "lPeople");
            return (Criteria) this;
        }

        public Criteria andLPeopleLessThanOrEqualTo(String value) {
            addCriterion("l_people <=", value, "lPeople");
            return (Criteria) this;
        }

        public Criteria andLPeopleLike(String value) {
            addCriterion("l_people like", value, "lPeople");
            return (Criteria) this;
        }

        public Criteria andLPeopleNotLike(String value) {
            addCriterion("l_people not like", value, "lPeople");
            return (Criteria) this;
        }

        public Criteria andLPeopleIn(List<String> values) {
            addCriterion("l_people in", values, "lPeople");
            return (Criteria) this;
        }

        public Criteria andLPeopleNotIn(List<String> values) {
            addCriterion("l_people not in", values, "lPeople");
            return (Criteria) this;
        }

        public Criteria andLPeopleBetween(String value1, String value2) {
            addCriterion("l_people between", value1, value2, "lPeople");
            return (Criteria) this;
        }

        public Criteria andLPeopleNotBetween(String value1, String value2) {
            addCriterion("l_people not between", value1, value2, "lPeople");
            return (Criteria) this;
        }

        public Criteria andLDesIsNull() {
            addCriterion("l_des is null");
            return (Criteria) this;
        }

        public Criteria andLDesIsNotNull() {
            addCriterion("l_des is not null");
            return (Criteria) this;
        }

        public Criteria andLDesEqualTo(String value) {
            addCriterion("l_des =", value, "lDes");
            return (Criteria) this;
        }

        public Criteria andLDesNotEqualTo(String value) {
            addCriterion("l_des <>", value, "lDes");
            return (Criteria) this;
        }

        public Criteria andLDesGreaterThan(String value) {
            addCriterion("l_des >", value, "lDes");
            return (Criteria) this;
        }

        public Criteria andLDesGreaterThanOrEqualTo(String value) {
            addCriterion("l_des >=", value, "lDes");
            return (Criteria) this;
        }

        public Criteria andLDesLessThan(String value) {
            addCriterion("l_des <", value, "lDes");
            return (Criteria) this;
        }

        public Criteria andLDesLessThanOrEqualTo(String value) {
            addCriterion("l_des <=", value, "lDes");
            return (Criteria) this;
        }

        public Criteria andLDesLike(String value) {
            addCriterion("l_des like", value, "lDes");
            return (Criteria) this;
        }

        public Criteria andLDesNotLike(String value) {
            addCriterion("l_des not like", value, "lDes");
            return (Criteria) this;
        }

        public Criteria andLDesIn(List<String> values) {
            addCriterion("l_des in", values, "lDes");
            return (Criteria) this;
        }

        public Criteria andLDesNotIn(List<String> values) {
            addCriterion("l_des not in", values, "lDes");
            return (Criteria) this;
        }

        public Criteria andLDesBetween(String value1, String value2) {
            addCriterion("l_des between", value1, value2, "lDes");
            return (Criteria) this;
        }

        public Criteria andLDesNotBetween(String value1, String value2) {
            addCriterion("l_des not between", value1, value2, "lDes");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}