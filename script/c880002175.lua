-- AUTO-GENERATED: OP14-010 / 바질 호킨스
-- rules_id=OP14-010 script_id=880002175 fingerprint=46da0afe4b720581ba0311fd49e2863cbb872065447ecd503beb1d28d519caf5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              base_power_lte=2000,
              card_type=[[CHARACTER]],
              name_neq=[[바질 호킨스]],
              trait=[[초신성]],
            },
            look_count=5,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            rested=false,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 덱 위에서 5장을 보고, 「바질 호킨스」 이외의 파워가 2000 이하인 《초신성》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-010]],
    schema_version=1,
  })
end
