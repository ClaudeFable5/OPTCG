-- AUTO-GENERATED: OP03-022 / 아론
-- rules_id=OP03-022 script_id=880000388 fingerprint=9b8abcd822801c8adc6f2954bc817299d1ca16b97eb7349a4f04a5c7b9407b13
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-022]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              has_trigger=true,
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
            op=[[REST_DON]],
          },
        },
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【어택 시】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 자신의 패에서 코스트 4 이하인 【트리거】를 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-022]],
    schema_version=1,
  })
end
