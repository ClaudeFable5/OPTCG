-- AUTO-GENERATED: ST09-008 / 시모츠키 우시마루
-- rules_id=ST09-008 script_id=880001856 fingerprint=9752bed3a8bdd4b42f8d088060ddbd2957d1b449572bdf8fd668381f3614f96d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST09-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              color=[[YELLOW]],
              cost_lte=4,
              trait=[[와노쿠니]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 자신의 패에서 코스트 4 이하이고 황색인 《와노쿠니》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST09-008]],
    schema_version=1,
  })
end
