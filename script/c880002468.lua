-- AUTO-GENERATED: EB04-047 / 헤르메포
-- rules_id=EB04-047 script_id=880002468 fingerprint=786e1db22e381c78c0860b38813f4bb37e14d69fb781100691cfdb4e0ac0b3c7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              name_neq=[[헤르메포]],
              trait=[[SWORD]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND_OR_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 패나 트래시에서 「헤르메포」 이외의 코스트 3 이하인 《SWORD》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-047]],
    schema_version=1,
  })
end
