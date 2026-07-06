-- AUTO-GENERATED: OP08-032 / 밀키
-- rules_id=OP08-032 script_id=880001008 fingerprint=123bad92eb4ca7ecac43088d55128a0167630028b506de091672329fe0f463dd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-032]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[밍크족]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 자신의 리더가 《밍크족》 특징을 가진 경우, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-032]],
    schema_version=1,
  })
end
