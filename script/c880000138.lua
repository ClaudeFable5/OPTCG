-- AUTO-GENERATED: OP01-015 / 토니토니 쵸파
-- rules_id=OP01-015 script_id=880000138 fingerprint=21e37fb921b6972338665fc9fbbe4a0c4ebe3f0d4fc4a2c3d49532f3d75984af
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              name_neq=[[토니토니 쵸파]],
              trait=[[밀짚모자 일당]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 패 1장을 버릴 수 있다: 자신의 트래시에서 「토니토니 쵸파」 이외의 코스트 4 이하인 《밀짚모자 일당》 특징을 가진 캐릭터 카드를 1장까지 패에 더한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-015]],
    schema_version=1,
  })
end
