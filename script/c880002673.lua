-- MANUAL: OP16-116 / 제하하하하하하!!! (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-116]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              name=[[마샬 D. 티치]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
          },
          {
            count=1,
            destination=[[OWNER_HAND]],
            mode=[[UP_TO]],
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[OPPONENT]],
            ["then"]=true,
          },
        },
        conditions={
          {
            count=10,
            op=[[FIELD_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 자신의 필드의 두웅!!이 10장 있을 경우, 자신의 패에서 「마샬 D. 티치」 1장까지를 등장시킨다. 그 후, 상대의 라이프 위에서 1장까지를 소유자의 패에 넣는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            mode=[[EXACT]],
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】 카드 2장을 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-116]],
    schema_version=1,
  })
end
