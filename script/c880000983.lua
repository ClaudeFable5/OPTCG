-- AUTO-GENERATED: OP08-007 / 토니토니 쵸파
-- rules_id=OP08-007 script_id=880000983 fingerprint=c67d85cf010943a3542a7c306f971b4613f944410b3777c2b1b84b861c0a7807
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              power_lte=4000,
              trait=[[동물]],
            },
            look_count=5,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            rested=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】【등장 시】/【어택 시】자신의 덱 위에서 5장을 보고, 파워 4000 이하인 《동물》 특징을 가진 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-007]],
    schema_version=1,
  })
end
