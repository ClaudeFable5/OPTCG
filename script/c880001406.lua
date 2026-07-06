-- AUTO-GENERATED: OP11-072 / 샬롯 몽도르
-- rules_id=OP11-072 script_id=880001406 fingerprint=029eda10e5ba0ec0d6fe88aa098430483da9d42fa48596d6d9292451a377132b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-072]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
            player=[[OPPONENT]],
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            position=[[TOP]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!!-1, 이 캐릭터를 레스트할 수 있다: 상대는 자신의 트래시에서 카드 2장을 원하는 순서대로 덱 맨 아래로 되돌린다. 그 후, 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-072]],
    schema_version=1,
  })
end
