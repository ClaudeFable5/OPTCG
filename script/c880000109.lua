-- AUTO-GENERATED: EB02-047 / 블루노
-- rules_id=EB02-047 script_id=880000109 fingerprint=0e8b497fd20ac6bc4366c2a2370ec20d17f7d685c1a02a8d92bb4f2969999c8d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
              name_neq=[[블루노]],
              trait_contains=[[CP]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 패 1장을 버리고, 이 캐릭터를 트래시에 놓을 수 있다: 자신의 트래시에서 「블루노」 이외의 코스트 5 이하인 『CP』를 포함한 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-047]],
    schema_version=1,
  })
end
